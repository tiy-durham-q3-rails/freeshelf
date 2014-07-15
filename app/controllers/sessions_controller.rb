class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: t(:logged_in)
    else
      flash.now.alert = t(:email_or_pass_invalid)
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t(:logged_out)
  end
end
