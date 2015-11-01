source "https://rubygems.org"

ruby "2.2.2"

gem "rails", "4.2.0"

gem "pg"
gem "sass-rails", "~> 5.0"
gem "slim-rails"
gem "therubyracer", platforms: :ruby
# gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.1.0"
gem "less-rails"
gem "angular_rails_csrf"
gem "font-awesome-rails"

gem "devise"
gem "omniauth-vkontakte"
gem "omniauth-facebook"
gem "omniauth-gplus"
gem "omniauth-github"
gem "cancancan", "~> 1.10"

gem "activeadmin", "~> 1.0.0.pre1"
gem "has_scope"
gem "active_model_serializers"
gem "rack-cors", require: "rack/cors"
gem "foreman"
gem "redcarpet"
gem "pg_search"
gem "russian"
gem "validators"

gem "carrierwave", github: "carrierwaveuploader/carrierwave"
gem "mini_magick"
gem "jader"

gem "fog-aws"
gem "gibbon"
gem "mandrill_mailer"

group :development do
  gem "overcommit"
  gem "heroku", require: false
end

group :development, :test do
  gem "pry"
  gem "thin"
  gem "dotenv-rails"
  gem "rspec-rails", "~> 3.2.0"
  gem "rubocop", require: false
end

group :test do
  gem "rspec"
  gem "rspec-activemodel-mocks"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
end

group :production, :staging do
  gem "rollbar", "~> 1.5.1"
  gem "puma"
  gem "rails_12factor"
end
