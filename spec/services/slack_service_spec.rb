require 'rails_helper'

describe SlackService, type: :service do
  context "returns error from Slack validation" do
    scenario "#authenticate returns false" do
      params = {"error" => "access_denied",
                "state" => ""}
                
      expect(SlackService.authenticate(params)).to eq(false)
    end
  end
  
  context "a validation attempt returns no code" do
    scenario "authenticate returns false" do
      params = {"state"=>""}
      
      expect(SlackService.authenticate(params)).to eq(false)
    end
  end
end