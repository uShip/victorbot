module SlackVictorbot
  class Bot < SlackRubyBot::Bot
    help do
      title 'SlackVictorbot'
      desc 'Interface with Victorops from Slack'

      command 'fire' do
        desc 'Triggers a Victorops incident with the <message>'
        long_desc "To create a new incident in Victorops and alert the on-call engineer(s),\nsay '@victorbot fire <message>'" # rubocop:disable Metrics/LineLength
      end

      command 'alert' do
        desc 'Triggers a Victorops incident with the <message> to a specified <team>'
        long_desc <<~DESC
          Creates a new incident in Victorops and sends it to the specified team.
          Find teams with @victorbot teams
        DESC
      end

      command 'teams' do
        desc 'List the teams available in Victorops'
      end
    end
  end
end
