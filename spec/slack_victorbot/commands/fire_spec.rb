describe SlackVictorbot::Commands::Fire do

  def app
    SlackVictorbot::Bot.instance
  end

  subject { app }

  context 'successfully creates a new incident' do
    use_vcr_cassette :victorops

    it 'returns the Victorops incident number if successful' do
      expect(message: "#{SlackRubyBot.config.user} fire It works!", channel: 'channel')
        .to respond_with_slack_message(/created Victorops incident 2296/i)
    end
  end
end
