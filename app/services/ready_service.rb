module ReadyService
  attr_reader
  
  def self.confirm_and_brew(text)
    incoming_request = text.to_s.split
    if incoming_request[0] == "coffee"
      response = brew_coffee(incoming_request)
    elsif incoming_request[0] == "tea" || incoming_request[0] == "water"
      {
        text: "Sorry, Coffee Maker Bot is unable to brew this at the moment."
      }
    else
      {
        text: "Sorry, I'm not sure what you meant by that."
      }
    end
  end
  
  private
  
  def self.brew_coffee(incoming_request)
    if incoming_request[1] == "ready"
      NewMakeService.start_making_a_drink(incoming_request[0])
    else
      {
        text: "Sorry, is the coffee pot ready to go?\nPlease make sure there are grounds in the basket and the coffee pot is ready, then try again."
      }
    end
  end
end