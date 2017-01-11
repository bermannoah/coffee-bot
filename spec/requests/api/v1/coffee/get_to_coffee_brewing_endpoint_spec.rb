require 'rails_helper'

describe "coffee_brewing endpoint GET requests" do
  context 'GET /api/v1/coffee_brewing' do
    it 'returns a brew with /last_brewed' do
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
    
    it 'returns only the most recent brew with /last_brewed' do
      team = Fabricate(:team, team_slack_id: "1234")
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew_1 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "delicious!")
      brew_2 = Fabricate(:brew, team: team, user_name: user.username, location: "Turing", description: "so good!")
      data = { 
               team_id: "1234", 
               team_domain: team.team_name,
               user_id: user.id,
               user_name: user.username,
               command: "/last_brewed",
               text: ""
             }
      expect(Brew.count).to eq(2)

      get "/api/v1/coffee_brewing", params: data.stringify_keys, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      brew = JSON.parse(response.body)

      expect(response).to be_success
      expect(brew["text"]).to eq("Last coffee brew(s):")
      expect(brew["attachments"][0]["text"]).to include("#{brew_2.description}")
      expect(brew["attachments"][0]["text"]).to include("Turing")
    end
    
    it 'returns multiple brews with /last_brewed if given a number' do
      team = Fabricate(:team, team_slack_id: "1234")
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew_1 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "delicious!")
      brew_2 = Fabricate(:brew, team: team, user_name: user.username, location: "Turing", description: "so good!")
      brew_3 = Fabricate(:brew, team: team, user_name: user.username, location: "The Moon", description: "made me feel weightless!")
      brew_4 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "best!")
      data = { 
               team_id: "1234", 
               team_domain: team.team_name,
               user_id: user.id,
               user_name: user.username,
               command: "/last_brewed",
               text: "4"
             }
      expect(Brew.count).to eq(4)

      get "/api/v1/coffee_brewing", params: data.stringify_keys, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      brews = JSON.parse(response.body)

      expect(response).to be_success
      expect(brews["text"]).to eq("Last coffee brew(s):")
      expect(brews["attachments"][0]["text"]).to include("Coffee was brewed in The Moon at")
      expect(brews["attachments"][0]["text"]).to include("made me feel weightless!")
      expect(brews["attachments"][0]["text"]).to include("delicious!")
      expect(brews["attachments"][0]["text"]).to include("Turing")
    end
    
    it 'returns only the number of brews requested for /last_brewed' do
      team = Fabricate(:team, team_slack_id: "1234")
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew_1 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "#1 delicious!")
      brew_2 = Fabricate(:brew, team: team, user_name: user.username, location: "Turing", description: "#2 so good!")
      brew_3 = Fabricate(:brew, team: team, user_name: user.username, location: "The Moon", description: "#3 made me feel weightless!")
      brew_4 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "#4 best!")
      data = { 
               team_id: "1234", 
               team_domain: team.team_name,
               user_id: user.id,
               user_name: user.username,
               command: "/last_brewed",
               text: "2"
             }
      expect(Brew.count).to eq(4)

      get "/api/v1/coffee_brewing", params: data.stringify_keys, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      brews = JSON.parse(response.body)

      expect(response).to be_success
      expect(brews["text"]).to eq("Last coffee brew(s):")
      expect(brews["attachments"][0]["text"]).to include("#3")
      expect(brews["attachments"][0]["text"]).to include("#4")
      expect(brews["attachments"][0]["text"]).to_not include("#1")
      expect(brews["attachments"][0]["text"]).to_not include("#2")
    end
    
    it 'returns brews with /last_brewed even if given a number greater than the number of brews' do
      team = Fabricate(:team, team_slack_id: "1234")
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew_1 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "delicious!")
      brew_2 = Fabricate(:brew, team: team, user_name: user.username, location: "Turing", description: "so good!")
      brew_3 = Fabricate(:brew, team: team, user_name: user.username, location: "The Moon", description: "made me feel weightless!")
      brew_4 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "best!")
      data = { 
               team_id: "1234", 
               team_domain: team.team_name,
               user_id: user.id,
               user_name: user.username,
               command: "/last_brewed",
               text: "4000"
             }
      expect(Brew.count).to eq(4)

      get "/api/v1/coffee_brewing", params: data.stringify_keys, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      brews = JSON.parse(response.body)

      expect(response).to be_success
      expect(brews["text"]).to eq("Last coffee brew(s):")
      expect(brews["attachments"][0]["text"]).to include("Coffee was brewed in The Moon at")
      expect(brews["attachments"][0]["text"]).to include("made me feel weightless!")
      expect(brews["attachments"][0]["text"]).to include("delicious!")
      expect(brews["attachments"][0]["text"]).to include("Turing")
    end

    it 'returns the most recent brew with /last_brewed even if given something other than a number' do
      team = Fabricate(:team, team_slack_id: "1234")
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew_1 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "delicious!")
      brew_2 = Fabricate(:brew, team: team, user_name: user.username, location: "Turing", description: "so good!")
      brew_3 = Fabricate(:brew, team: team, user_name: user.username, location: "The Moon", description: "made me feel weightless!")
      brew_4 = Fabricate(:brew, team: team, user_name: user.username, location: "Home", description: "best!")
      data = { 
               team_id: "1234", 
               team_domain: team.team_name,
               user_id: user.id,
               user_name: user.username,
               command: "/last_brewed",
               text: "Albatrosses"
             }
      expect(Brew.count).to eq(4)

      get "/api/v1/coffee_brewing", params: data.stringify_keys, headers: { 'CONTENT_TYPE' => 'application/json'}
      
      brews = JSON.parse(response.body)

      expect(response).to be_success
      expect(brews["text"]).to eq("Last coffee brew(s):")
      expect(brews["attachments"][0]["text"]).to include("Home")
      expect(brews["attachments"][0]["text"]).to include("best!")
    end
  end
end
