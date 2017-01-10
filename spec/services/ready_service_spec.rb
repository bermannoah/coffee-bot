require 'rails_helper'

describe ReadyService, type: :service do
  context "with a server on the pi" do
    scenario "it POSTs a new make if it is told that things are ready", :vcr do
      text = "coffee ready"
      maker_bot_response = ReadyService.confirm_and_brew(text)

      expect(maker_bot_response["text"]).to be_a(String)
      expect(maker_bot_response["text"]).to eq("Starting to brew coffee!")
    end
    
    scenario "it gets the right response for different kinds of drinks", :vcr do
      maker_bot_response_1 = ReadyService.confirm_and_brew("coffee ready")
      maker_bot_response_2 = ReadyService.confirm_and_brew("tea ready")
      maker_bot_response_3 = ReadyService.confirm_and_brew("water ready")

      expect(maker_bot_response_1["text"]).to eq("Starting to brew coffee!")
      expect(maker_bot_response_2[:text]).to eq("Sorry, Coffee Maker Bot is unable to brew this at the moment.")
      expect(maker_bot_response_3[:text]).to eq("Sorry, Coffee Maker Bot is unable to brew this at the moment.")
    end

    scenario "it returns an error for an improper request", :vcr do
      maker_bot_response_1 = ReadyService.confirm_and_brew("balloons")
      maker_bot_response_2 = ReadyService.confirm_and_brew(1234)
      maker_bot_response_3 = ReadyService.confirm_and_brew("Robert'); DROP TABLE Makes;--")

      expect(maker_bot_response_1[:text]).to eq("Sorry, I'm not sure what you meant by that.")
      expect(maker_bot_response_2[:text]).to eq("Sorry, I'm not sure what you meant by that.")
      expect(maker_bot_response_3[:text]).to eq("Sorry, I'm not sure what you meant by that.")
    end

    scenario "it returns an error if not given anything to brew", :vcr do
      maker_bot_response_1 = ReadyService.confirm_and_brew("")

      expect(maker_bot_response_1[:text]).to eq("Sorry, I'm not sure what you meant by that.")
    end
  end
end