# Configure Rails Envinronment
ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# FIXME orm
ActiveRecord::Migration.verbose = false

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load Factories
require 'factory_girl'
Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each {|f| require f}

require 'database_cleaner'

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.color_enabled = true
  config.tty = true

  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, type: :controller
  config.include ActionView::RecordIdentifier, type: :feature
  config.include Rails.application.routes.url_helpers, type: :helper

  config.before(:suite) do
   DatabaseCleaner.strategy = :transaction
   DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
   DatabaseCleaner.start
  end

  config.after(:each) do
   DatabaseCleaner.clean
  end 
end

