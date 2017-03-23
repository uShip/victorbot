describe SlackVictorbot::Commands::SendAlert do
  vcr_options = { cassette_name: 'victorops', record: :new_episodes }

  def app
    SlackVictorbot::Bot.instance
  end

  subject { app }

  context 'successfully creates and incident', vcr: vcr_options do
    it 'alerts a specified team' do
      expect(message: "#{SlackRubyBot.config.user} send alert \"Help me!\" to IT",
             channel: 'channel')
        .to respond_with_slack_message(/sent alert to IT team/i)
    end
  end
end
