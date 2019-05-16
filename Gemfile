source 'https://rubygems.org'

ruby '2.6.3'
gem 'rails', '~> 5.2'
gem 'pg', '~> 0.2'
gem 'responders'
gem 'figaro'
gem 'faraday'
# Use Puma as the app server
gem 'puma'
gem 'bcrypt'
# Adds multitenancy via gem
gem 'apartment'
gem 'bootsnap', require: false
gem 'omniauth'
gem 'omniauth-slack'

group :development, :test do
  gem 'foreman'
  gem 'pry'
  gem 'faker'
  # Might as well use the day-job styles
  gem 'wetransfer_style'
end

group :development do
  gem 'listen'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'brakeman',  require: false
  gem 'simplecov', require: false
end
