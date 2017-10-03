source 'https://rubygems.org'

ruby '2.4.2'
gem 'rails'
gem 'unicorn'
gem 'pg'
gem 'responders'
gem 'figaro'
gem 'faraday'
# Use Puma as the app server
gem 'puma'
gem 'bundler'
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# Use ActiveModel has_secure_password
gem 'bcrypt'
# Adds multitenancy via gem
gem 'apartment'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# Boot reallllll quick like
gem 'bootsnap', require: false

group :development, :test do
  gem 'foreman'
  gem 'pry-rails'
  gem 'faker'
end

group :development do
  gem 'listen'
  gem 'rails_real_favicon'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'webmock'
  gem 'brakeman',  require: false
  gem 'simplecov', require: false
  gem 'vcr'
  gem "codeclimate-test-reporter", "~> 1.0.0"
end