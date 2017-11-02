source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Active Admin
gem 'activeadmin'
gem 'active_admin_flat_skin'

gem 'coffee-rails'
gem 'devise'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'font-awesome-sass'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'mini_racer', platforms: :ruby
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rack-attack'
gem 'rails', '~> 5.1.4'
gem 'react_on_rails'
gem 'responders'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
  gem 'selenium-webdriver'
  gem 'pry-byebug'
end

group :test do
  gem 'brakeman', require: false
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'guard-brakeman', require: false
  gem 'guard-rspec'
  gem 'poltergeist' # headless javascript testing
  gem 'shoulda'
  gem 'rspec-rails'
  gem 'rspec-sidekiq'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
