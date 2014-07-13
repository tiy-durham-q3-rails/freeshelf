ruby '2.1.2'

source 'https://rubygems.org'
source 'https://rails-assets.org'

## Rails core gems
gem 'rails', '~> 4.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'spring', group: :development

gem 'acts-as-taggable-on', '~> 3.3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave', '~> 0.10.0'
gem 'kaminari', '~> 0.16.1'
gem 'faker', '~> 1.4.1'
gem 'font-awesome-sass', '~> 4.1.0'
gem 'foundation-rails', '~> 5.3.0'
gem 'fog', '~> 1.22.1'
gem 'friendly_id', '~> 5.0.0'
gem 'holder_rails'
gem 'identicon', '~> 0.0.3'
gem 'mini_magick', '~> 3.7.0'
gem 'oembedr'
gem 'rails-assets-mailcheck'
gem 'simple_form', '~> 3.0.2'
gem 'slim', '~> 2.0.3'
gem 'sprig', '~> 0.1.6'

group :production do
  gem 'rails_12factor'
  gem 'postmark-rails'
  gem 'unicorn', '~> 4.8.3'
end

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "brakeman", :require => false
  gem 'dotenv-rails'
  gem "pry-rails"
  gem 'quiet_assets'
  gem "rails_best_practices", :require => false
  gem "rake", :require => false
end

group :test do
  gem 'capybara', :require => false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'poltergeist'
  gem 'simplecov', '~> 0.7.1', :require => false
  gem 'selenium-webdriver'
  gem "wrong", :require => false
end
