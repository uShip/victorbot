require 'sinatra/base'

module SlackVictorbot
  class Web < Sinatra::Base
    get '/' do
      'This is the Victorops bot for Slack'
    end
  end
end
