require 'rest-client'

module SlackVictorbot
  module Commands
    class Fire < SlackRubyBot::Commands::Base
      help do
        command 'fire <message>' do
          desc 'Triggers a Victorops incident with the <message>'
          long_desc "To create a new incident in Victorops and alert the on-call engineer(s),\n \
            say '@victorbot fire <message>'"
        end
      end

      match /fire (?<message>.+)$/i do |client, data, match|
        headers = {
          content_type:  'json',
          accept:        'json',
          'X-VO-Api-Id'  => ENV['VICTOROPS_API_ID'],
          'X-VO-Api-Key' => ENV['VICTOROPS_API_KEY']
        }

        payload = {
          summary:  match[:message],
          details:  match[:message],
          userName: ENV['VICTOROPS_USER'],
          targets: [
            {
              type: 'EscalationPolicy',
              slug: ENV['VICTOROPS_TEAM']
            }
          ]
        }.to_json

        response = RestClient.post ENV['VICTOROPS_API_URL'], payload, headers
        if response.code == 200
          response_body = JSON.parse response.body
          client.say channel: data.channel,
            text: "Created Victorops incident #{response_body['incidentNumber']}"
        else
          client.say channel: data.channel, text: 'Error creating incident'
        end
      end
    end
  end
end
