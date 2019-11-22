require 'faraday'
require 'json'
# Just in case

module WebhookService

  def self.coffee_is_brewing(webhook_url, webhook_time, webhook_text, params)
    send_brew_notification(webhook_url, webhook_time, webhook_text, params, 'coffee')
  end

  def self.kettle_is_brewing(webhook_url, webhook_time, webhook_text, params)
    send_brew_notification(webhook_url, webhook_time, webhook_text, params, 'the kettle')
  end

  def self.send_brew_notification(webhook_url, webhook_time, webhook_text, params, type)
    conn = Faraday.new(url: webhook_url)
    text = params['text'].split(' ')
    location = text.shift || params['team_domain']
    description = text.join(' ')

    body_text = if !description.empty?
                  {
                    text: "#{params['user_name']} has just started brewing #{type} in #{location}!",
                    attachments: [{text: description.to_s}]
                  }
                else
                  {text: "#{params['user_name']} has just started brewing #{type} in #{location}!"}
                end

    conn.post do |req|
      req.url webhook_url
      req.headers['Content-Type'] = 'application/json'
      req.body = body_text.to_json
    end

    WebhookReminderJob.set(wait: webhook_time.minutes).perform_later(webhook_url, 'coffee', text: webhook_text)
  end

end
