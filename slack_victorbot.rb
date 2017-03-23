require 'dotenv'
Dotenv.load

require 'slack-ruby-bot'
require 'slack_victorbot/helpers/client_helper'
require 'slack_victorbot/commands/fire'
require 'slack_victorbot/commands/send_alert'
require 'slack_victorbot/bot'
