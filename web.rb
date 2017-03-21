require 'sinatra/base'

module SlackVictorbot
  # Public: This is the entrypoint for the Sinatra webapp
  class Web < Sinatra::Base
    get '/' do
      'This is the Victorops bot for Slack'
    end
  end
end
