class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: root_path }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_mail(user, slug, tag)
    TagMailer.deliver_new_tag_alert(user, slug, tag)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :email_update)
  end
end
