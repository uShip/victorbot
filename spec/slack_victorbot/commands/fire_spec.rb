describe SlackVictorbot::Commands::Fire do
  vcr_options = { cassette_name: 'victorops', record: :new_episodes }

  def app
    SlackVictorbot::Bot.instance
  end

  subject { app }

  context 'successfully creates a new incident', vcr: vcr_options do
    it 'returns the Victorops incident number if successful' do
      expect(message: "#{SlackRubyBot.config.user} fire It works!",
             channel: 'channel')
        .to respond_with_slack_message(/created Victorops incident/i)
    end
  end
end
