require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "users get an api_token on save" do
    user = User.new(:email => "test@example.org", :name => "Test User",
                    :password => "test", :password_confirmation => "test")
    assert { user.api_token.nil? }
    user.save!
    deny { user.api_token.nil? }
  end
end
