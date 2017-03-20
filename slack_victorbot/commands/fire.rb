module SlackVictorbot
  module Commands
    class Fire < SlackRubyBot::Commands::Base
      command 'fire' do |client, data, _match|
        client.say channel: data.channel, text: 'It works!'
      end
    end
  end
end
