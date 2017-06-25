module WebhookService
  
  def self.coffee_is_brewing(webhook_url,params)
    conn = Faraday.new(:url => webhook_url)
    puts params["user_name"]
    puts params["location"]
    puts params["description"]
    if params["description"] != "" 
      body_text = {text:"#{params["user_name"]} has just started brewing coffee in #{params["location"]}!",
                   attachments:"#{params["description"]}"}
    else 
      body_text = {text:"#{params["user_name"]} has just started brewing coffee in #{params["location"]}!"}
    end
    conn.post do |req|
      req.url webhook_url
      req.headers['Content-Type'] = 'application/json'
      req.body = body_text.to_json
    end
  end  
end