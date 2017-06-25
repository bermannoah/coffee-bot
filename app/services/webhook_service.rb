module WebhookService
  
  def self.coffee_is_brewing(brew)
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
  
  def message_to_send_with_comment(params,text)
    {
    "attachments": [
        {
            "fallback": "#{user_name} has started brewing coffee!",
            "pretext": "#{user_name} has started brewing coffee!",
            "text": "#{text.join(' ')}",
            "fields": [
                {
                    "title": "Location",
                    "value": text.shift || params["team_domain"],
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