class UsersController < ApplicationController
  def index
    @username = params[:username]
    cache_key = "peeper/tweets/#{@username}"

    @tweets = Rails.cache.fetch(cache_key, expires_in: 15.seconds) do
      tweets = twitter_client.user_timeline(@username)
    end
  end

  def info
    username = params[:username]
    cache_key = "peeper/info/#{username}"

    user_data = Rails.cache.fetch(cache_key, expires_in: 15.seconds) do
      user = twitter_client.user(username)
      {
        screen_name:      user.screen_name,
        tweets_count:     user.tweets_count,
        followers_count:  user.followers_count
      }
    end

    render json: user_data
  end

  private

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end
end
