require 'rails_helper'

describe 'make endpoint POST requests', pi_dependent: true do
  context 'POST /api/v1/make' do
    it 'it sends a request to an external server', :vcr do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/make',
        text: 'coffee ready'
      }

      post '/api/v1/make', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      result = JSON.parse(response.body)
      expect(response).to be_success
      expect(result['text']).to eq('Starting to brew coffee!')
    end

    it 'if successful, it creates a new brew', :vcr do
      team = Team.create!(team_name: 'Hello', team_slack_id: '1000')
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/make',
        text: 'coffee ready'
      }
      expect(Brew.count).to eq(0)

      post '/api/v1/make', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      result = JSON.parse(response.body)
      expect(response).to be_success
      expect(result['text']).to eq('Starting to brew coffee!')
      expect(Brew.count).to eq(1)
    end

    it 'if successful, it creates a new brew for the right team', :vcr do
      team = Team.create!(team_name: 'Hello', team_slack_id: '1000')
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/make',
        text: 'coffee ready'
      }
      expect(Brew.count).to eq(0)

      post '/api/v1/make', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      result = JSON.parse(response.body)
      expect(response).to be_success
      expect(result['text']).to eq('Starting to brew coffee!')
      expect(Brew.count).to eq(1)
      expect(Brew.first.team_id).to eq(team.id)
      expect(Brew.first.description).to eq('Made by Coffee Maker Bot!')
    end

    it 'if successful, it creates a new brew for the right team', :vcr do
      team = Team.create!(team_name: 'Hello', team_slack_id: '1000')
      user = Fabricate(:slack_login_user, team_id: team.id)
      Fabricate(:brew)
      Fabricate(:brew)
      Fabricate(:brew)
      Fabricate(:brew)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/make',
        text: 'coffee ready'
      }
      expect(Brew.count).to eq(4)

      post '/api/v1/make', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      result = JSON.parse(response.body)
      expect(response).to be_success
      expect(result['text']).to eq('Starting to brew coffee!')
      expect(Brew.count).to eq(5)
      expect(Brew.last.team_id).to eq(team.id)
      expect(Brew.last.description).to eq('Made by Coffee Maker Bot!')
    end
  end
end
