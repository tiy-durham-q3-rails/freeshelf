class AccountMailer < ActionMailer::Base
  default from: "clinton@dreisbach.us"

  def password_reset(reset)
    @user = reset.user
    @url = password_reset_url(id: reset.token)

    mail to: @user.email, subject: "Reset your Freeshelf password"
  end

  def email_confirmation(user, confirmation)
    @user = user
    @url = account_verification_url(id: confirmation.token)

    mail to: @user.email, subject: "Freeshelf, Welcome!"
  end
end
