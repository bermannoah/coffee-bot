module WebhookService
  
  def self.coffee_is_brewing(webhook_url,brew)
    conn = Faraday.new(:url => webhook_url)
    if brew.description
      body_text = message_to_send_with_comment(brew)
    else 
      body_text = {text:"#{brew.user_name} has just started brewing coffee!"}
    end
    conn.post do |req|
      req.url webhook_url
      req.headers['Content-Type'] = 'application/json'
      req.body = body_text.to_json
    end
  end
  
  def self.message_to_send_with_comment(brew)
    {
    "attachments": [
        {
            "fallback": "#{brew.user_name} has started brewing coffee!",
            "pretext": "#{brew.user_name} has started brewing coffee!",
            "text": "#{brew.description}",
            "fields": [
                  {
                      "title": "Location",
                      "value": brew.location,
                      "short": false
                  }
                ],
              "footer": "CoffeeBot",
              "footer_icon": "☕️",
              "ts": 12321313
          }
      ]
    }
  end
  
end