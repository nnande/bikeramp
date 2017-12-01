# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.4'

gem 'rails', '5.1.0'
gem 'pg'
gem 'gistance', github: 'nnande/gistance'

group :development do
  gem 'spring'
  gem 'listen'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry'
end
