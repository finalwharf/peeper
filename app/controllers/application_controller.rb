class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # We do not make any post requests to this app, so this is not necessary
  # protect_from_forgery with: :exception
end
