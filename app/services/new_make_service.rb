module NewMakeService
  
  def self.start_making_a_drink(type)
    send_make_request(type)
  end
  
  private
  
  def self.conn
    Faraday.new(:url => "http://10.1.1.102:8080") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
  
  def self.send_make_request(type)
    response = conn.post '/api/v1/makes', { :type => type }
    JSON.parse(response.body)
  end
  
end