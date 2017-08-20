require 'capybara/rspec'
require 'coveralls'
require 'simplecov'

require './app/app'
require_relative './features/web_helper'

Capybara.app = Coolpay

RSpec.configure do |config|
  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  Coveralls.wear!
  
  config.expect_with :rspec do |expectations|
   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  
  config.mock_with :rspec do |mocks|
    
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
