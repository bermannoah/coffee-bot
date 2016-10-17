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
      "response_type": "in_channel",
      "text": "#{user_name} has started brewing coffee in #{location} at #{time}.",
      "attachments": [
        {
          "text":"#{description}"
              }
            ]
    }
  end

  def get_last_brewed(limit)
    list = ''
    Brew.limit(limit).each do |brew|
      time = brew.created_at.strftime("%I:%M:%S %p")
      list << "#{brew.user_name} brewed coffee in #{brew.location} at #{time}. | #{brew.description}\n"
    end
    {
      "text": "Last coffee brews:",
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
