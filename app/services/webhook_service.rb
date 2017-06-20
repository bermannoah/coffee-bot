module WebhookService
  
  def coffee_is_brewing(time,params,webhook_url)
    conn = Faraday.new(:url => webhook_url)
    conn.post {"text":"Coffee started brewing at #{time}!"}
  end
  
end