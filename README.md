# SlackVictorbot

This is a Slack Bot for interacting with Victorops. It's built on the [Slack-Ruby-Bot](https://github.com/slack-ruby/slack-ruby-bot/) framework. It also has Docker integration so running in a container is very easy.

## Usage

After you've [registered your bot](https://github.com/slack-ruby/slack-ruby-bot/blob/4c9e0b8b34b7fbac56960ebd742ec594be35bbee/DEPLOYMENT.md) in Slack, to test the Victorbot, you'll need to copy the `.env.example` file to `.env` and update the variables for your preferences. For local testing, it's easiest to use [Docker Compose](https://docs.docker.com/compose/overview/) to build and run the container.

If you want to just run the bot outside of a container, you can use [Foreman](https://github.com/theforeman/foreman)

    $ bundle exec foreman start

## Required variables

The following environment variables are required for SlackVictorbot to work:

| Variable          | Description                                  |
| ----------------- | -------------------------------------------- |
| SLACK_API_TOKEN   | Token for interacting with the Slack API     |
| VICTOROPS_API_ID  | Your Victorops user's API ID                 |
| VICTOROPS_API_KEY | Your Victorops user's API key                |
| VICTOROPS_API_URL | The URL of the Victorops API                 |
| VICTOROPS_USER    | Your Victorops username                      |
| VICTOROPS_TEAM    | Your Victorops team to escalate incidents to |

## Testing

SlackVictorbot uses a test harness wired with [RSpec](https://github.com/rspec/rspec), [VCR](https://github.com/vcr/vcr), and [Webmock](https://github.com/bblimke/webmock). The use if VCR and Webmock means that the first time the specs are run, they'll save a cassette to `spec/fixtures/vcr_cassettes` and then subsequent requests will be mocked and use that fixture file. If there is any sensitive data that needs to be sanitized from the fixture file, add that to the `VCR.configure` block in `spec/spec_helper.rb`.

To run the specs, you can either run them directly from your machine, or use Docker.

### From your machine

    # Install the dependencies
    $ bundle Install

    # Run the specs
    $ bundle exec rspec specs

### Using Docker with Compose

    # Build the image
    $ docker-compose build

    # Run the specs in a one-off container
    $ docker-compose run web bundle exec rspec

    # Keep container running to run the specs more than once
    $ docker-compose run web /bin/bash
    root@4ae327290864:/usr/src/app# bundle exec rspec spec

## Deployment

SlackVictorbot can be deployed as a normal Ruby application or in a containerized environment. The biggest thing to ensure is that the environment variables listed above are available when the application or container is started.
