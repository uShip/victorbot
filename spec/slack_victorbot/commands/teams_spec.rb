describe SlackVictorbot::Commands::Teams do
  vcr_options = { cassette_name: 'victorops_teams', record: :new_episodes }

  def app
    SlackVictorbot::Bot.instance
  end

  subject { app }

  context 'successfully returns the Victorops teams', vcr: vcr_options do
    it 'returns a list of Victorops teams' do
      expect(message: "#{SlackRubyBot.config.user} teams",
             channel: 'channel')
        .to respond_with_slack_message(/Victorops teams: .+/i)
    end
  end
end
