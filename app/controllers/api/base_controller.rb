class API::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by_api_token(params[:api_token])
  end

  def authorize
    render nothing: true, status: :forbidden if current_user.nil?
  end
end
