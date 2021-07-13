# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'aasm', '~> 5.2.0'
gem 'acts_as_list', '~> 1.0.4'
gem 'ancestry', '~> 4.1.0'
gem 'aws-sdk-s3', '~> 1.94'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '~> 4.7.3'
gem 'devise-i18n', '~> 1.9.4'
gem 'draper', '~> 4.0'
gem 'hotwire-rails', '~> 0.1.3'
gem 'image_processing', '~> 1.12.1'
gem 'lograge', '~> 0.11'
gem 'memoist', '~> 0.16'
gem 'paper_trail', '~> 12.0'
gem 'pg', '~> 1.1'
gem 'pry-rails', '~> 0.3'
gem 'pry-stack_explorer', '~> 0.6'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.1'
gem 'rails', '~> 6.1.1'
gem 'rolify', '~> 5.3'
gem 'sentry-rails', '~> 4.5.1'
gem 'sentry-ruby', '~> 4.5.1'
gem 'sidekiq', '~> 6.2.1'
gem 'simple_form', '~> 5.1.0'
gem 'translation', '~> 1.23'
gem 'webpacker', '~> 5.0'

group :development do
  gem 'active_record_query_trace', '~> 1.8'
  gem 'better_errors', '~> 2.9'
  gem 'binding_of_caller', '~> 1.0'
  gem 'brakeman', '~> 5.0'
  gem 'erb_lint', '~> 0.0', require: false
  gem 'guard', '~> 2.16', require: false
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'guard-rubocop', '~> 1.4', require: false
  gem 'listen', '~> 3.3'
  gem 'pry-rescue', '~> 1.5'
  gem 'rails-erd', '~> 1.6.1'
  gem 'rubocop', '~> 1.8', require: false
  gem 'rubocop-performance', '~> 1.9', require: false
  gem 'rubocop-rails', '~> 2.9', require: false
  gem 'rubocop-rspec', '~> 2.1', require: false
  gem 'spring'
end

group :development, :test do
  gem 'bullet', '~> 6.1.4'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'fuubar', '~> 2.5'
  gem 'rspec-rails', '~> 5.0.1'
end

group :test do
  gem 'cucumber-rails', '~> 2.2', require: false
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'rspec-html-matchers', '~> 0.9'
  gem 'selenium-webdriver', '4.0.0.beta2'
  gem 'shoulda-matchers', '~> 4.5'
  gem 'simplecov', require: false
end

group :production do
  gem 'mailgun-ruby', '~> 1.2.4'
end
