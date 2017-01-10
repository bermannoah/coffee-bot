module ReadyService
  attr_reader
  
  def self.confirm_and_brew(text)
    incoming_request = text.split
    if incoming_request[1] == "ready"
      response = NewMakeService.start_making_a_drink(incoming_request[0])
      response["message"]
    else
      {
        "text": "Sorry, is the coffee pot ready to go?"
      }
    end
  end
  
end