# frozen_string_literal: true

require 'bundler/setup'
require 'shareasale'
require 'vcr'
require './spec/support/shared_context'

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :faraday
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<AUTH>') do |interaction|
    interaction.request.headers['x-Shareasale-Authentication'].first
  end
  config.filter_sensitive_data('<TOKEN>') { ENV['TOKEN'] }
  config.filter_sensitive_data('<AFFILIATE_ID>') { ENV['AFFILIATE_ID'] }
  config.filter_sensitive_data('<API_SECRET>') { ENV['API_SECRET'] }
end
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include_context 'with an initialized client'
end
