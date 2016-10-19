class Brew < ApplicationRecord


  def self.create_new_brew(params)
    text = params["text"].split(' ')
    location = text.shift || "Blake"
    Brew.create!(
        user_name: params["user_name"],
        location: location,
        description: text.join(' ')
    )
  end

  def get_response
    time = created_at.strftime("%I:%M:%S %p")
    {
      "text": "Hey #{user_name} thanks for brewing coffee! You're a hero!"
      "attachments": [
        {
          "text":"#{description}"
              }
            ]
    }
  end

  def self.get_last_brewed(limit)
    list = ''
    Brew.order(created_at: :desc).limit(limit).each do |brew|
      time = brew.created_at.strftime("%I:%M:%S %p")
      list << "#{brew.user_name} brewed coffee in #{brew.location} at #{time}. | #{brew.description}\n"
    end
    {
      "text": "Last coffee brew(s):",
      "attachments": [
        {
          "text": list
        }
      ]
    }
  end

  def self.get_limit(input)
    input.to_i != 0 ? input.to_i : 1
  end

end
