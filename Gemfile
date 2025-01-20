# frozen_string_literal: true

source 'https://rubygems.org'

gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.2.2', '>= 7.2.2.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'sqlite3'
end

group :development do
  gem 'brakeman', require: false
  gem 'faker'
  gem 'rubocop-capybara', require: false
  gem 'rubocop-rails-omakase', require: false
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
