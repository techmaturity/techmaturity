source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.6.2'
# Use sqlite3 as the  database for Active Record
gem 'sqlite3', '1.3.13'
gem 'pg', '1.0.0'
# Use Puma as the app server
gem 'puma', '4.3.8'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.8'

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.3.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.1.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.7.0'
# Will Paginate gem is used for pagination of the assets index page
gem 'will_paginate', '3.1.6'
# Faker gem is used to generate mock data for testing
gem 'faker', '1.8.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  #     console
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'minitest-rails-capybara'
  gem 'rubocop', '0.54.0', require: false
end

group :development do
  gem 'listen', '~> 3.1.5'
  # Spring speeds up development by keeping your application running in the
  #     background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.8'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
