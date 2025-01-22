# frozen_string_literal: true

source 'https://rubygems.org'

gem 'puma', '>= 5.0'
gem 'rails', '~> 7.2.2', '>= 7.2.2.1'

gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'simple_form'
gem 'slim-rails'

gem 'devise'
gem 'devise-i18n'

gem 'ancestry'

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'faker'
  gem 'sqlite3'
end

group :development do
  gem 'brakeman', require: false
  gem 'rubocop-capybara', require: false
  gem 'rubocop-rails-omakase', require: false
  gem 'rubocop-slim', require: false
  gem 'slim_lint', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'minitest-power_assert'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
end
