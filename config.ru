$LOAD_PATH.unshift File.dirname(__FILE__)

require 'slack_victorbot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackVictorbot::Bot.run
  rescue StandardError => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackVictorbot::Web
