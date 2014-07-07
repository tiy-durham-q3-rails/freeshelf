class AccountMailer < ActionMailer::Base
  default from: "clinton@dreisbach.us"

  def password_reset(reset)
    @user = reset.user
    @url = password_reset_url(id: reset.token)

    mail to: @user.email, subject: "Reset your Freeshelf password"
  end
end
