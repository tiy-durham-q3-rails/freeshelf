require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  def assert_logged_in(user)
    within(".notice") do
      assert { page.has_text? I18n.t('.logged_in') }
    end
    within(".main-nav") do
      assert { page.has_text? I18n.t('.logged_as', name: user.name) }
    end
  end

  test "users can log in" do
    visit login_path
    fill_in "Email", :with => users(:one).email
    fill_in "Password", :with => default_password
    click_button "Login"
    assert_logged_in(users(:one))
  end

  test "users can log out" do
    login
    click_link "Logout"
    within(".notice") do
      assert { page.has_text? I18n.t ('.logged_out') }
    end
  end

  test "users can reset password" do
    visit login_path
    click_link "Forgot your password?"
    fill_in "Your email", :with => users(:one).email
    click_button "Reset password"
    within(".notice") do
      assert { page.has_text?("password reset link") }
    end

    # testing that an email was sent with the reset password link
    # TODO find a better way to test this
    email = ActionMailer::Base.deliveries.last
    assert_equal "Reset your Freeshelf password", email.subject
    token = PasswordReset.last.token
    text_body = email.body.parts[0].to_s
    assert_match password_reset_url(token), text_body

    visit password_reset_path(token)
    fill_in "Password", :with => "new-password"
    fill_in "Password confirmation", :with => "new-password"
    click_button "Update User"

    within(".notice") do
      assert { page.has_text? "password has been updated" }
    end

    login(users(:one), "new-password")
    assert_logged_in(users(:one))
  end
end
