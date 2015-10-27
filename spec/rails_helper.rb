ENV["RAILS_ENV"] = "test"

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara/webkit'
require 'capybara-screenshot/rspec'
require 'capybara/email/rspec'
require 'simplecov'

SimpleCov.start 'rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl
end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  if config.filter_manager.inclusions[:ci]
    Capybara.javascript_driver = :poltergeist
    config.filter_manager.inclusions.delete(:ci)
  else
    Capybara.javascript_driver = :webkit
  end

  Capybara.ignore_hidden_elements = true
  Capybara.default_host = 'localhost'
  Capybara.server_port = 9887
  Capybara.app_host = "http://#{Capybara.default_host}:#{Capybara.server_port}"

  Capybara::Webkit.configure do |config|
    config.block_unknown_urls
  end

  config.use_transactional_fixtures = false
end

ActiveRecord::Migration.maintain_test_schema!
