class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def authorize
    redirect_to login_url, alert: "You must log in to do that." if current_user.nil?
  end

  def current_user_access
    if current_user.user
    end
  end

  def authenticate_admin_user!
    unless current_admin_user.admin
      redirect_to login_url, alert: "You must be admin to do that."

    end
  end

end
