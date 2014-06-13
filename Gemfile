# Gemfile

source 'https://rubygems.org'

gem 'sinatra'
gem 'activerecord'
gem 'activesupport'

gem 'sinatra-activerecord'
gem 'sinatra-flash'
gem 'sinatra-redirect-with-flash'

gem 'icalendar', "~> 2.0"

gem 'haml'

gem 'mysql2'

gem 'rake'

#gem 'net_dav'

group :development do
 gem "shotgun"
 gem 'sqlite3'
 gem 'tux'
 gem 'travis', require: false
end

group :production do
 gem 'pg'
end

group :test do
  gem 'rspec', '~> 2.9'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'pry'
end