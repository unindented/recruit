source 'https://rubygems.org'

gem 'rails',                '4.1.5'

gem 'devise',               '~> 3.3.0'
gem 'rails_admin',          '~> 0.6.3'

gem 'gon',                  '~> 5.2.0'
gem 'haml-rails',           '~> 0.5.3'
gem 'sass-rails',           '~> 4.0.3'
gem 'coffee-rails',         '~> 4.0.1'
gem 'jquery-rails',         '~> 3.1.2'

gem 'simple_form',          '~> 3.1.0.rc2'
gem 'bootstrap-sass',       '~> 3.2.0'

group :assets do
  gem 'uglifier',           '~> 2.5.3'
end

group :staging, :production do
  gem 'pg',                 '~> 0.17.1'
  gem 'rails_12factor',     '~> 0.0.2'
end

group :development do
  gem 'sqlite3',            '~> 1.3.9'

  gem 'meta_request',       '~> 0.3.4'
  gem 'better_errors',      '~> 2.0.0'
  gem 'binding_of_caller',  '~> 0.7.2'
  gem 'brakeman',           '~> 2.6.2', require: false
end

group :test do
  gem 'database_cleaner',   '~> 1.3.0'
  gem 'shoulda-matchers',   '~> 2.7.0'
  gem 'cucumber-rails',     '~> 1.4.1', require: false
  gem 'simplecov',          '~> 0.9.0', require: false

  gem 'poltergeist',        '~> 1.5.1'
  gem 'phantomjs',          '~> 1.9.7', require: 'phantomjs/poltergeist'
end

group :development, :test do
  gem 'rspec-rails',        '~> 3.0.2'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'ffaker',             '~> 1.25.0'
end
