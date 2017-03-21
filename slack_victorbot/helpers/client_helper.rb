module SlackVictorbot
  # Public: Helpers for RestClient to talk to Victorops
  module ClientHelper
    def headers
      {
        content_type:  'json',
        accept:        'json',
        'X-VO-Api-Id'  => ENV['VICTOROPS_API_ID'],
        'X-VO-Api-Key' => ENV['VICTOROPS_API_KEY']
      }
    end

    def payload(message)
      {
        summary:  message,
        details:  message,
        userName: ENV['VICTOROPS_USER'],
        targets: [{ type: 'EscalationPolicy', slug: ENV['VICTOROPS_TEAM'] }]
      }.to_json
    end
  end
end
