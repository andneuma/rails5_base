# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'faker'
require 'rspec/rails'
require 'spec_helper'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'pry'

# # Custom helper methods
require 'support/rspec_helpers'
require 'support/capybara_helpers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
#
# CAPYBARA configuration
Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app,
                                      phantomjs_options: ['--ignore-ssl-errors=true'],
                                      inspector: true)
end

Capybara.configure do |config|
  config.javascript_driver = :poltergeist
  config.current_driver = Capybara.javascript_driver
end

RSpec.configure do |config|
  # Ensure that if we are running js tests, we are using latest webpack assets
  # This will use the defaults of :js and :server_rendering meta tags
  ReactOnRails::TestHelper.configure_rspec_to_compile_assets(config)

  config.include Warden::Test::Helpers
  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.before(:each, no_transaction: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    Warden.test_reset!
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Capybara::DSL

  config.include RSpecHelpers
  config.include CapybaraHelpers
end                                                
