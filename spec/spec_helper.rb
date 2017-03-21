$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')

require 'slack-ruby-bot/rspec'
require 'slack_victorbot'
require 'pry'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock

  config.filter_sensitive_data('<API_ID>') { ENV['VICTOROPS_API_ID'] }
  config.filter_sensitive_data('<API_KEY>') { ENV['VICTOROPS_API_KEY'] }
  config.filter_sensitive_data('<VICTOROPS_USER>') { ENV['VICTOROPS_USER'] }
  config.filter_sensitive_data('<VICTOROPS_TEAM>') { ENV['VICTOROPS_TEAM'] }
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
