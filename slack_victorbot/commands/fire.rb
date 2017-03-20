module SlackVictorbot
  module Commands
    class Fire < SlackRubyBot::Commands::Base
      help do
        command 'fire <message>' do
          desc 'Triggers a Victorops alert with the <message>'
          long_desc "To create a new alert in Victorops and send it to the on-call engineer(s),\n \
            say '@victorbot fire <message>'"
        end
      end

      match /fire (?<message>.+)$/i do |client, data, match|
        client.say channel: data.channel, text: match[:message]
      end
    end
  end
end
