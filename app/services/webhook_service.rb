require 'faraday'
require 'json'
# Just in case

module WebhookService
  
  def self.coffee_is_brewing(webhook_url,params)
    conn = Faraday.new(:url => webhook_url)
    text = params["text"].split(' ')
    location = text.shift || params["team_domain"]
    description = text.join(' ')
    if !description.empty?
      body_text = {text:"#{params["user_name"]} has just started brewing coffee in #{location}!",
                   attachments:[{text:"#{description}"}]}
    else 
      body_text = {text:"#{params["user_name"]} has just started brewing coffee in #{location}!"}
    end
    conn.post do |req|
      req.url webhook_url
      req.headers['Content-Type'] = 'application/json'
      req.body = body_text.to_json
    end
    
    WebhookReminderJob.set(wait: 30.seconds).perform_later(webhook_url)
  end  
end