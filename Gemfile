source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# purecss for styling
gem 'purecss'
# selectize for intelligent select boxes
gem 'selectize-rails'
# paloma for page-specific javascript
gem 'paloma'
# HAML for markup
gem 'haml'
gem 'flash_render'
# Use oj instead of default json
gem 'oj'
gem 'oj_mimic_json'
# taglib for reading ID3
gem 'taglib-ruby'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# In production
group :production do
  # Use puma as the app server
  gem 'puma'
  # Use postgres as the
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Better error handling
  gem 'better_errors'
  gem 'binding_of_caller'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'factory_girl_rails'
  #gem 'debugger'
end

group :test do
  gem 'rake'
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: nil
end


