class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def authorize
    redirect_to login_url, alert: "You must log in to do that." if current_user.nil?
  end

  def authenticate_admin_user!
    authorize
  end

  def AdminUser
    AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
  end
end
