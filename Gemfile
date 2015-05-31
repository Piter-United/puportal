source "https://rubygems.org"

ruby "2.2.2"

gem "rails", "4.2.0"

gem "pg"
gem "sass-rails", "~> 5.0"
gem "slim-rails"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "materialize-sass"
gem "autoprefixer-rails"

gem "therubyracer", platforms: :ruby

gem "devise"
gem "omniauth-vkontakte"
gem "omniauth-facebook"
gem "omniauth-gplus"
gem "omniauth-github"

gem "geocoder"
gem "draper"
gem "redcarpet"
gem "russian"
gem "active_model_serializers"
gem "carrierwave", ">= 0.10.0"
gem "mini_magick"
gem "foreman"
gem "rollbar", "~> 1.5.1"

gem "jquery-rails"
gem "sdoc", "~> 0.4.0", group: :doc

group :development do
  gem "capistrano-rails",           require: false
  gem "capistrano-bundler",         require: false
  gem "capistrano-rbenv", "~> 2.0", require: false
end

group :development, :test do
  gem "pry"
  gem "thin"
  gem "dotenv-rails"
  gem "rspec-rails", "~> 3.2.0"
  gem "rspec-activemodel-mocks"
  gem "rubocop", require: false
  gem "byebug"
  gem "web-console", "~> 2.0"
  gem "spring"
end

group :test do
  gem "capybara", "~> 2.4.4"
  gem "rspec"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "json-schema-rspec"
  gem "shoulda-matchers"
end

group :production do
  gem "unicorn"
  gem "unicorn-worker-killer"
end
