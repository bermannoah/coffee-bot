module ReadyService
  
  def self.confirm_and_brew(brew_data)
    incoming_request = brew_data["text"].to_s.split
    if incoming_request[0] == "coffee"
      response = brew_coffee(incoming_request)
      make_brew_creation(brew_data)
    elsif incoming_request[0] == "tea" || incoming_request[0] == "water"
      unable_to_brew
    else
      what_did_you_mean
    end
  end
  
  private
    
  def self.brew_coffee(incoming_request)
    if incoming_request[1] == "ready"
      MakeService.start_making_a_drink(incoming_request[0])
    else
      {
        text: "Sorry, is the coffee pot ready to go?\nPlease make sure there are grounds in the basket and the coffee pot is ready, then try again."
      }
    end
  end
  
  def self.make_brew_creation(brew_data)
    brew_hash = { "text" => brew_data["make"] }
    Brew.create_new_brew_from_make(brew_hash)
  end
  
  def self.unable_to_brew
    {
      text: "Sorry, Coffee Maker Bot is unable to brew this at the moment."
    }
  end
  
  def self.what_did_you_mean
    {
      text: "Sorry, I'm not sure what you meant by that."
    }
  end
end