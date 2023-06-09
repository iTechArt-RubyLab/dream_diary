source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'aws-sdk-s3', require: false
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'kredis'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'redis', '~> 4.0'
gem 'rubocop-rails', require: false
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'devise', '~> 4.9', '>= 4.9.1'
gem 'omniauth', '~> 2.1', '>= 2.1.1'
gem 'omniauth-google-oauth2', '~> 1.1', '>= 1.1.1'
gem 'omniauth-rails_csrf_protection', '~> 1.0', '>= 1.0.1'

gem 'bootstrap', '~> 5.2', '>= 5.2.3'
gem 'octicons_helper', '~> 19.1'

gem 'cancancan', '~> 3.5'
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
gem 'sidekiq', '~> 7.0', '>= 7.0.7'
gem 'sidekiq-cron', '~> 1.10'
gem 'simple_form', '~> 5.2'

gem 'google-cloud-storage', '~> 1.44', require: false
gem 'image_processing', '>= 1.2'
gem 'ruby-vips', '~> 2.1', '>= 2.1.4'

gem 'date_validator', '~> 0.12.0'

gem 'avo'
gem 'geocoder', '~> 1.8', '>= 1.8.1'

gem 'http_accept_language', '~> 2.1', '>= 2.1.1'

gem 'elasticsearch', '~> 8.7', '>= 8.7.1'
gem 'searchkick', '~> 5.2', '>= 5.2.4'

gem 'pagy', '~> 6.0', '>= 6.0.4'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1', '>= 3.1.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'shoulda-matchers', '~> 5.3'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'webdrivers'
end
