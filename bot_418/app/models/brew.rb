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
  
end
