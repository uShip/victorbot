$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')

require 'slack-ruby-bot/rspec'
require 'slack_victorbot'
require 'pry'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
