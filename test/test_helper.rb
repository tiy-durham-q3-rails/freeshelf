require 'simplecov'
SimpleCov.start 'rails'
SimpleCov.command_name "MiniTest"

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/poltergeist'
require "headless"
require "wrong"
require "bcrypt"

module TestPasswordHelper
  def default_password_digest
    BCrypt::Password.create(default_password, cost: 4)
  end

  def default_password
    "password"
  end
end

class ActiveSupport::TestCase
  include TestPasswordHelper
  include Wrong

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper
  set_fixture_class :tags => ActsAsTaggableOn::Tag
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login(user = nil)
    if user.nil?
      user = users(:one)
    end
    @request.env["rack.session"]["user_id"] = user.id
    user
  end
end

Capybara.register_driver :poltergeist_debug do |app|
  Capybara::Poltergeist::Driver.new(app, :inspector => true)
end

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :poltergeist
# Capybara.javascript_driver = :poltergeist_debug
Capybara.server_port = 31337
DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  self.use_transactional_fixtures = false
  include Capybara::DSL

  def setup
    host! "127.0.0.1:#{Capybara.server_port}"
    DatabaseCleaner.start
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    DatabaseCleaner.clean
  end

  def use_javascript
    Capybara.current_driver = Capybara.javascript_driver
  end

  def use_driver(driver)
    Capybara.current_driver = driver
  end

  def use_selenium
    Capybara.current_driver = :selenium
    if block_given?
      Headless.ly do
        yield
      end
    end
  end

  def login(user = nil, password = nil)
    user ||= users(:one)
    password ||= default_password
    visit login_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => password
    click_button "Login"
    user
  end
end
