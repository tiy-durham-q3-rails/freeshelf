class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  include SessionsHelper

  def set_locale
  	I18n.locale = get_user_locale || I18n.default_locale
  end

  private

  def authorize
    redirect_to login_url, alert: "You must log in to do that." if current_user.nil?
  end

  def get_user_locale
  	current_user.locale if current_user
  end

end
