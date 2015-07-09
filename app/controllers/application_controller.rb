class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'koala'
  Koala.config.api_version = 'v2.0'

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def graph
    @graph ||= Koala::Facebook::API.new(ENV['FB_TOKEN']) if ENV['FB_TOKEN']
  end
  helper_method :current_user, :graph
end
