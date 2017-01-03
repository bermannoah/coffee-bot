require 'rails_helper'

describe "coffee_brewing endpoint GET requests" do
  context 'GET /api/v1/coffee_brewing' do
    it 'returns recent brew with /last_brewed' do
      team = Fabricate(:team, team_slack_id: "1234")
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "delicious!")
      data = { 
               team_id: "1234", 
               team_domain: team.team_name,
               user_id: user.id,
               user_name: user.username,
               command: "/last_brewed",
               text: ""
             }
      expect(Brew.count).to eq(1)

      get "/api/v1/coffee_brewing", params: data.stringify_keys, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      brew = JSON.parse(response.body)

      expect(response).to be_success
      expect(brew["text"]).to eq("Last coffee brew(s):")
      expect(brew["attachments"][0]["text"]).to include("Coffee was brewed in Home at")
      expect(brew["attachments"][0]["text"]).to include("delicious!")
    end
  end
end
