module WebhookService
  
  def self.coffee_is_brewing(webhook_url,params)
    conn = Faraday.new(:url => webhook_url)
    if params["description"] != "" 
      body_text = message_to_send_with_comment(params).to_s
    else 
      body_text = {text:"#{user_name} has just started brewing coffee!"}
    end
    conn.post do |req|
      req.url webhook_url
      req.headers['Content-Type'] = 'application/json'
      req.body = body_text
    end
  end
  
  def self.message_to_send_with_comment(params)
    {
    "attachments": [
        {
            "fallback": "#{params["user_name"]} has started brewing coffee!",
            "pretext": "#{params["user_name"]} has started brewing coffee!",
            "text": "#{params["description"]}",
            "fields": [
                  {
                      "title": "Location",
                      "value": "#{params["location"]}",
                      "short": false
                  }
                ],
              "footer": "CoffeeBot",
              "footer_icon": "☕️"
          }
      ]
    }
  end
  
end