module MakeService
  
  def self.start_making_a_drink(type)
    send_make_request(type)
  end
    
  def self.conn
    Faraday.new(:url => "#{ENV['COFFEE_MAKER_BOT_IP']}:8080") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def self.send_make_request(type)
    response = conn.post '/api/v1/makes', { :type => type }
    JSON.parse(response.body)
  end
  
end