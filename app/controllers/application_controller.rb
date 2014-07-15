class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include SessionsHelper

  private

  def authorize
    respond_to do |format|
      format.html do
        redirect_to login_url, alert: "You must log in to do that." if current_user.nil?
      end
      format.js do
        render nothing: true, status: :forbidden if current_user.nil?
      end
      format.json do
        render nothing: true, status: :forbidden if current_user.nil?
      end
    end

  end
end
