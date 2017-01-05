require 'rails_helper'

describe NewMakeService, type: :service do
  context "with a server on localhost" do
    scenario "it POSTs a new make", :vcr do
      make_type = "coffee"
      maker_bot_response = NewMakeService.start_making_a_drink(make_type)

      expect(maker_bot_response).to be_a(Hash)
      expect(maker_bot_response).to have_key("message")
      expect(maker_bot_response).to have_value("Heating water for coffee!")
    end
    
    scenario "it gets the right response for different kinds of drinks", :vcr do
      maker_bot_response_1 = NewMakeService.start_making_a_drink("coffee")
      maker_bot_response_2 = NewMakeService.start_making_a_drink("tea")
      maker_bot_response_3 = NewMakeService.start_making_a_drink("water")

      expect(maker_bot_response_1).to have_value("Heating water for coffee!")
      expect(maker_bot_response_2).to have_value("Heating water for tea!")
      expect(maker_bot_response_3).to have_value("Heating water!")
    end
  end
end