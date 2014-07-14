class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    confirm = EmailConfirmation.find_by_user_id(user.id)
    if confirm
      flash.now.alert = "You must confirm your account to log in. Check your email for an invitation."
      render :new
    else
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "You are now logged in."
      else
        flash.now.alert = "Email or password is invalid"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You are now logged out."
  end
end
