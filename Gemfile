source 'https://rubygems.org'

gem 'rails',                '3.2.13'

gem 'strong_parameters',    '~> 0.2.1'

gem 'devise',               '~> 2.2.4'
gem 'rails_admin',          '~> 0.4.8'

gem 'gon',                  '~> 4.1.0'
gem 'haml-rails',           '~> 0.4.0'
gem 'sass-rails',           '~> 3.2.6'
gem 'coffee-rails',         '~> 3.2.2'
gem 'jquery-rails',         '~> 2.2.1'

gem 'simple_form',          '~> 2.1.0'
gem 'bootstrap-sass',       '~> 2.3.1'

group :assets do
  gem 'uglifier',           '~> 2.1.1'
end

group :staging, :production do
  gem 'pg',                 '~> 0.15.1'
end

group :development do
  gem 'sqlite3',            '~> 1.3.7'

  gem 'meta_request',       '~> 0.2.5'
  gem 'better_errors',      '~> 0.8.0'
  gem 'binding_of_caller',  '~> 0.7.1'
  gem 'brakeman',           '~> 1.9.5', require: false
end

group :test do
  gem 'capybara',           '~> 2.0.3'
  gem 'capybara-webkit',    '~> 0.14.2'
  gem 'database_cleaner',   '~> 1.0.1'
  gem 'shoulda-matchers',   '~> 2.1.0'
  gem 'cucumber-rails',     '~> 1.3.1', require: false
  gem 'simplecov',          '~> 0.7.1', require: false
end

group :development, :test do
  gem 'rspec-rails',        '~> 2.13.2'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'ffaker',             '~> 1.16.1'
end
