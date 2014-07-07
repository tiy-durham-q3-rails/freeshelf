# Preview all emails at http://localhost:3000/rails/mailers/account_mailer
class AccountMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_mailer/password_reset
  def password_reset
    reset = PasswordReset.new(user: User.first)
    reset.set_token
    reset.expires_at
    AccountMailer.password_reset(reset)
  end

end
