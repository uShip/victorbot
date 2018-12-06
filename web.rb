require 'sinatra/base'

module SlackVictorbot
  # Public: This is the entrypoint for the Sinatra webapp
  class Web < Sinatra::Base
    get '/' do
      ABOUT
    end
  end
end
