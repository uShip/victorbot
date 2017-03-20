describe SlackVictorbot::Commands::Fire do
  def app
    SlackVictorbot::Bot.instance
  end

  subject { app }

  it 'returns It works!' do
    expect(message: "#{SlackRubyBot.config.user} fire", channel: 'channel')
      .to respond_with_slack_message('It works!')
  end
end
