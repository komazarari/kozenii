source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4'

gem 'mysql2'

# Use SCSS for stylesheets
# gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'


gem 'less-rails'
gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

gem 'devise'
gem 'haml-rails'
gem 'figaro'
gem 'kaminari', github: 'amatsuda/kaminari', ref: 'v0.16.1'
gem 'ransack'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test, :development do
  gem "rspec-rails" , "~>2"
  #  gem "rspec-rails" , "<2.99"
  gem 'factory_girl_rails'
  gem "spring"
  gem "spring-commands-rspec"
  gem 'guard-spring'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner', '~> 1'
  gem 'capybara'
  gem 'poltergeist'
  gem "simplecov", require: false
end
