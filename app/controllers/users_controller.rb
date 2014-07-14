class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :change_password, :update,
                                  :change_password_update]

  def new
    @user = User.new
  end

  def edit
  end

  def change_password
  end

  def create
    @user = User.new(user_params)
    if @user.save
      confirm = EmailConfirmation.create(user: @user)
      AccountMailer.email_confirmation(@user, confirm).deliver
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up! Check your email for account confirmation."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to root_url, notice: 'You updated your profile.'
    else
      render :edit
    end
  end

  def change_password_update
    if @user.update(user_params)
      redirect_to root_url, notice: 'You changed your password.'
    else
      render :change_password
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
