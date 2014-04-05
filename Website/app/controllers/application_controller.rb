class ApplicationController < ActionController::Base
  protect_from_forgery
    before_filter :login, :except => [:new, :create]
  private
  def login
    authenticate_or_request_with_http_basic("Appointment Admin") do |username, password|
      user = User.find_by_username(username)
      user != nil && password == user.password
    end
  end
end
