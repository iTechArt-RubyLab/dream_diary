source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'redis', '~> 4.0'

gem 'kredis'

gem 'bcrypt', '~> 3.1.7'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

gem 'rubocop-rails', require: false

gem 'aws-sdk-s3', require: false

gem 'devise', '~> 4.9', '>= 4.9.1'
gem 'omniauth', '~> 2.1', '>= 2.1.1'

gem 'sidekiq', '~> 7.0', '>= 7.0.7'

gem 'simple_form', '~> 5.2'

gem 'bootstrap', '~> 5.2', '>= 5.2.3'

gem 'cancancan', '~> 3.5'

gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker', '~> 3.1', '>= 3.1.1'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
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
