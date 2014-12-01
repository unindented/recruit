source 'https://rubygems.org'

gem 'rails',                '~> 4.1.8'

gem 'devise',               '~> 3.4.1'
gem 'rails_admin',          '~> 0.6.5'

gem 'gon',                  '~> 5.2.3'
gem 'haml-rails',           '~> 0.5.3'
gem 'sass-rails',           '~> 4.0.5'
gem 'coffee-rails',         '~> 4.1.0'
gem 'jquery-rails',         '~> 3.1.2'

gem 'simple_form',          '~> 3.1.0'
gem 'bootstrap-sass',       '~> 3.3.1'

group :assets do
  gem 'uglifier',           '~> 2.5.3'
end

group :staging, :production do
  gem 'pg',                 '~> 0.17.1'
  gem 'rails_12factor',     '~> 0.0.3'
end

group :development do
  gem 'sqlite3',            '~> 1.3.10'

  gem 'meta_request',       '~> 0.3.4'
  gem 'better_errors',      '~> 2.0.0'
  gem 'binding_of_caller',  '~> 0.7.2'
  gem 'brakeman',           '~> 2.6.3', require: false
end

group :test do
  gem 'database_cleaner',   '~> 1.3.0'
  gem 'shoulda-matchers',   '~> 2.7.0'
  gem 'cucumber-rails',     '~> 1.4.2', require: false
  gem 'coveralls',          '~> 0.7.2', require: false

  gem 'poltergeist',        '~> 1.5.1'
  gem 'phantomjs',          '~> 1.9.7', require: 'phantomjs/poltergeist'
end

group :development, :test do
  gem 'rspec-rails',        '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'ffaker',             '~> 1.25.0'
end
