module UsersHelper
  def beautify(text)
    # Usernames are only use letters, numbers and '_'
    text = text.gsub(/@([a-z0-9_]*)/i, '<a data-username="\1" href="/\1" class="popsover">@\1</a>')

    # Hashtags all the way to a space
    text = text.gsub(/(#\S*)/, '<strong><em>\1</em></strong>')

    # Links all the way to a space
    text = text.gsub(/(https?:\/\/\S*)/i, '<a href="\1" target="_blank">\1</a>')

    text.html_safe
  end
end
