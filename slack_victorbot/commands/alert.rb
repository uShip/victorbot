require 'rest-client'

module SlackVictorbot
  module Commands
    # Public: Contains code to make 'send alert' command work
    class Alert < SlackRubyBot::Commands::Base
      extend SlackVictorbot::ClientHelper

      command 'alert' do |client, data, match|
        match_data = /(?<message>.+) to (?<team>\w+)/.match(match[:expression])
        response = RestClient.post "#{ENV['VICTOROPS_API_URL']}/incidents",
                                   payload(match_data[:message], match_data[:team]),
                                   headers
        if response.code == 200
          response_body = JSON.parse response.body
          client.say channel: data.channel,
                     text: "Created Victorops incident #{response_body['incidentNumber']} and sent alert to #{match_data[:team]} team" # rubocop:disable Metrics/LineLength
        else
          client.say channel: data.channel, text: 'Error creating incident'
        end
      end
    end
  end
end
