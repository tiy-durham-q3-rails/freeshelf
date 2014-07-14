module SessionsHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end
end
