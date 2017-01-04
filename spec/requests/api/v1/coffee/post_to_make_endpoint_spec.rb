require 'rails_helper'

describe "make endpoint POST requests" do
  context "POST /api/v1/make" do
    it "it sends a request to an external server", :vcr do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = { 
               team_id: team.id, 
               team_domain: team.team_name,
               user_id: user.id,
               user_name: user.username,
               command: "/make",
               text: "coffee"
             }
    
      post "/api/v1/make", params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}
    
      result = JSON.parse(response.body)
      expect(response).to be_success
    end
  end
end