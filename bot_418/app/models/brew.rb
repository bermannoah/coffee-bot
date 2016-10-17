class Brew < ApplicationRecord
  
  def self.create_new_brew(params)
    text = params["text"].split(' ')
    location = text.shift
    Brew.create!(
        user_name: params["user_name"],
        location: location,
        description: text.join(' ')
    )
  end
  
  def get_response
    time = created_at.strftime("%I:%M:%S %p")
    {
      "response_type": "in_channel",
      "text": "#{user_name} has started brewing coffee in #{location} at #{time}.",
      "attachments": [
        {
          "text":"#{description}"
              }
            ]
    }
  end
  
  def get_last_brewed
    time = created_at.strftime("%I:%M:%S %p")
    {
      "text": "#{user_name} brewed coffee in #{location} at #{time}.",
      "attachments": [
        {
          "text":"#{description}"
              }
            ]
    }
  end
  
end
