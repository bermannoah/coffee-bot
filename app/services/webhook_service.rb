module WebhookService
  
  def coffee_is_brewing(time,params,webhook_url)
    conn = Faraday.new(:url => webhook_url)
    body_text = {text:'Coffee started brewing at #{time}!'}
    conn.post do |req|
      req.url webhook_url
      req.headers['Content-Type'] = 'application/json'
      req.body = body_text.to_json
    end
  end
  
end