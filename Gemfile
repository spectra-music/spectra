source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Angular for the frontend
gem 'angularjs-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# purecss for styling
gem 'purecss', '~> 0.5.0'
# selectize for intelligent select boxes
gem 'selectize-rails'
# pikaday and moment for date select
gem 'pikaday-gem'
gem 'momentjs-rails'

gem 'underscore-rails'

# SLIM for markup
gem 'slim'
gem 'slim-rails'
gem 'flash_render'

# taglib for reading ID3
gem 'taglib-ruby'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Friendly stubs for a verbose api
gem 'friendly_id', '~> 5.0.0'
# Paperclip manages our album covers
gem 'paperclip', '~> 4.1'
# RABL helps us build better APIs
gem 'rabl'
# Persistent user preferences
gem 'rails-settings-cached', '~> 0.4.1'

gem 'has_scope'



# In production
group :production do
  # Use puma as the app server
  gem 'puma'
  # Use postgres as the database on production
  gem 'pg'
  gem 'rails_12factor'
  # Use oj instead of default json
  gem 'oj'
  gem 'oj_mimic_json'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer',  platforms: :ruby
end

group :development do
  # Better error handling
  gem 'better_errors'
  gem 'binding_of_caller'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Pry offers a better rails console
  gem 'pry-rails'
  gem 'faker'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # RSpec instead of MiniTest::Unit because BDD is best
  gem 'rspec-rails', '~> 3.0.0'
  # Factory girl populates our database
  gem 'factory_girl_rails'
  #Testing angular
  gem 'jasmine-rails'
end

group :test do
  gem 'rake'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: nil
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end
