class WebhookBrewWorker
  include Sidekiq::Worker

  def perform(*args)
    conn = Faraday.new(:url => webhook_url)
    update_text = {text:"The coffee is probably ready!"}
    conn.post do |req|
      req.url webhook_url
      req.headers['Content-Type'] = 'application/json'
      req.body = update_text.to_json
    end
  end
end
