source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.0'
# Use sqlite3 as the  database for Active Record
gem 'sqlite3', '1.3.13'
gem 'pg', '0.19.0'
# Use Puma as the app server
gem 'puma', '3.8.2'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '3.2.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.3.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.6.4'
# Will Paginate gem is used for pagination of the assets index page
gem 'will_paginate', '3.1.0'
# Faker gem is used to generate mock data for testing
gem 'faker', '1.7.3'

# see about bugs here:
# https://stackoverflow.com/questions/43886586/minitest-plugin-rb9-getting-wrong-number-of-arguments
gem 'minitest', '~> 5.10', '!= 5.10.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  #     console
  gem 'byebug', platform: :mri
  gem 'rubocop', '0.49.1', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the
  #     background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'factory_girl_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
