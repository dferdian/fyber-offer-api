source 'https://rubygems.org'

gem 'dotenv-rails', :groups => [:development, :test]
gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

group :development, :test do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'rspec-rails'
  gem 'webmock'
  gem 'capybara'
  gem 'selenium-webdriver', require: false
  gem 'poltergeist', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor', '~> 0.0.2'
end
