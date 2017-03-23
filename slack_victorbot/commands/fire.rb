require 'rest-client'

module SlackVictorbot
  module Commands
    # Public: Contains code to make 'fire' command work
    class Fire < SlackRubyBot::Commands::Base
      extend SlackVictorbot::ClientHelper

      command 'fire' do |client, data, match|
        response = RestClient.post "#{ENV['VICTOROPS_API_URL']}/incidents",
                                   payload(match[:expression]),
                                   headers
        if response.code == 200
          response_body = JSON.parse response.body
          client.say channel: data.channel,
                     text: "Created Victorops incident #{response_body['incidentNumber']}" # rubocop:disable Metrics/LineLength
        else
          client.say channel: data.channel, text: 'Error creating incident'
        end
      end
    end
  end
end
