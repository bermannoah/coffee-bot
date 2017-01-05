require 'rails_helper'

describe NewMakeService, type: :service do
  context "with a server on localhost" do
    scenario "it POSTs a new make", :vcr do
      make_type = "coffee"
      maker_bot_response = NewMakeService.start_making_a_drink(type = make_type)

      expect(maker_bot_response).to be_a(Hash)
      expect(maker_bot_response).to have_key("message")
      expect(posted_repo_response).to have_value("Heating water for coffee!")
    end
  end
end