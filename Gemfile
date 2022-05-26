# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'aasm', '~> 5.2'
gem 'acts_as_list', '~> 1.0'
gem 'ancestry', '~> 4.1'
gem 'aws-sdk-s3', '~> 1.100'
gem 'bootsnap', '>= 1.4', require: false
gem 'devise', '~> 4.8'
gem 'devise-i18n', '~> 1.9'
gem 'draper', '~> 4.0'
gem 'image_processing', '~> 1.12'
gem 'lograge', '~> 0.11'
gem 'memoist', '~> 0.16'
gem 'net-imap', '~> 0.2'
gem 'net-pop', '~> 0.1'
gem 'net-smtp', '~> 0.3'
gem 'paper_trail', '~> 12.0'
gem 'pg', '~> 1.1'
gem 'pry-rails', '~> 0.3'
gem 'pry-stack_explorer', '~> 0.6'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.1'
gem 'rails', '~> 7.0'
gem 'rolify', '~> 6.0'
gem 'sentry-rails', '~> 4.5'
gem 'sentry-ruby', '~> 4.5'
gem 'sidekiq', '~> 6.2'
gem 'simple_form', '~> 5.1'
gem 'stimulus-rails', '~> 1.0'
gem 'translation', '~> 1.23'
gem 'turbo-rails', '~> 1.0'
gem 'webpacker', '~> 5.0'

group :development do
  gem 'active_record_query_trace', '~> 1.8'
  gem 'better_errors', '~> 2.9'
  gem 'binding_of_caller', '~> 1.0'
  gem 'brakeman', '~> 5.0'
  gem 'erb_lint', '~> 0.0', require: false
  gem 'guard', '~> 2.18', require: false
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'guard-rubocop', '~> 1.4', require: false
  gem 'listen', '~> 3.3'
  gem 'pry-rescue', '~> 1.5'
  # rails-erd does not support Rails 7 just yet
  # gem 'rails-erd', '~> 1.6'
  gem 'rubocop', '~> 1.24', require: false
  gem 'rubocop-performance', '~> 1.13', require: false
  gem 'rubocop-rails', '~> 2.13', require: false
  gem 'rubocop-rspec', '~> 2.7', require: false
  gem 'spring'
end

group :development, :test do
  gem 'bullet', '~> 7.0'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'fuubar', '~> 2.5'
  gem 'rspec-rails', '~> 5.0'
end

group :test do
  # Because of: https://github.com/twalpole/apparition/issues/80
  gem 'apparition', github: 'twalpole/apparition', ref: 'ca86be4d54af835d531dbcd2b86e7b2c77f85f34'
  gem 'cucumber-rails', '~> 2.5', require: false
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'matrix', '~> 0.4', require: false
  gem 'selenium-webdriver', '4.0.0.beta4'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
end

group :production do
  gem 'mailgun-ruby', '~> 1.2'
end
