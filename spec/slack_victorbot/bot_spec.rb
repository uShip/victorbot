describe SlackVictorbot::Bot do
  def app
    SlackVictorbot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
