class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include SessionsHelper

  private

  def authorize
    redirect_to login_url, alert: "You must log in to do that." if current_user.nil?
  end
end
