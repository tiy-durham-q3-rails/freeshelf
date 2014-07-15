module SessionsHelper
  def current_user
    @current_user ||= if request.format.symbol == :json
                        User.find_by_api_token(params[:api_token])
                      else
                        User.find_by_id(session[:user_id]) if session[:user_id]
                      end
  end

  def current_user?(user)
    current_user == user
  end
end
