source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails'
gem 'devise'
gem 'faker', :git => 'git://github.com/stympy/faker.git', :branch => 'master'
gem 'font-awesome-sass'
gem 'haml-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rack-attack'
gem 'responders'
gem 'react_on_rails'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-byebug'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'poltergeist' # headless javascript testing
  gem 'rspec-rails'
  gem 'rspec-sidekiq'
  gem 'shoulda'
end

group :development do
  gem 'brakeman', require: false
  gem 'guard'
  gem 'guard-brakeman', require: false
  gem 'guard-rspec'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mini_racer', platforms: :ruby
