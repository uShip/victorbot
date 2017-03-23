require 'rest-client'

module SlackVictorbot
  module Commands
    # Public: Contains code to make 'fire' command work
    class Teams < SlackRubyBot::Commands::Base
      extend SlackVictorbot::ClientHelper

      command 'teams' do |client, data, _match|
        response = RestClient.get "#{ENV['VICTOROPS_API_URL']}/team",
                                   headers
        if response.code == 200
          teams = JSON.parse(response).map { |x| x["name"] }
          client.say channel: data.channel,
                     text: "Victorops teams: #{teams.join(' ')}"
        else
          client.say channel: data.channel, text: 'Error creating incident'
        end
      end
    end
  end
end
