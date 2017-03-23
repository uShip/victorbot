require 'rest-client'

module SlackVictorbot
  module Commands
    # Public: Contains code to make 'send alert' command work
    class SendAlert < SlackRubyBot::Commands::Base
      extend SlackVictorbot::ClientHelper

      help do
        title 'send alert'
        desc 'Triggers a Victorops incident with the <message> to a specified <team>'
        long_desc <<~DESC
          Creates a new incident in Victorops and sends it to the specified team.
          Find teams with @victorbot teams
        DESC
      end

      match /^(?<bot>\w*) send alert "(?<message>.+)" to (?<team>\w+)/i do |client, data, match|
        response = RestClient.post "#{ENV['VICTOROPS_API_URL']}/incidents",
                                   payload(match[:message], match[:team]),
                                   headers
        if response.code == 200
          response_body = JSON.parse response.body
          client.say channel: data.channel,
                     text: "Created Victorops incident #{response_body['incidentNumber']} and sent alert to #{match[:team]} team" # rubocop:disable Metrics/LineLength
        else
          client.say channel: data.channel, text: 'Error creating incident'
        end
      end
    end
  end
end
