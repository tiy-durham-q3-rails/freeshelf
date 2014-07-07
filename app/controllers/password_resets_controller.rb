class PasswordResetsController < ApplicationController
  before_action :find_password_reset, only: [:show, :update]

  def new
  end

  def create
    email = params[:email]
    user = User.find_by_email(email)

    if user
      PasswordReset.where(user_id: user.id).destroy_all
      password_reset = PasswordReset.create(user: user)
      AccountMailer.password_reset(password_reset).deliver
    end

    redirect_to root_path, notice: "You will receive a password reset link in your email."
  end

  def show
  end

  def update
    if password_params[:password].blank?
      @user.confirm_password_present
      render :show
    elsif @user.update(password_params)
      @password_reset.destroy
      redirect_to root_path, notice: "Your password has been updated."
    else
      render :show
    end
  end

  private

  def find_password_reset
    @token = params[:id]
    @password_reset = PasswordReset.find_by_token!(@token)
    @user = @password_reset.user
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
