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
    {
      "response_type": "in_channel",
      "text": "#{self.user_name} has started brewing coffee in #{self.location} at #{self.created_at}.",
      "attachments": [
        {
          "text":"#{self.description}"
              }
            ]
    }
  end
  
end
