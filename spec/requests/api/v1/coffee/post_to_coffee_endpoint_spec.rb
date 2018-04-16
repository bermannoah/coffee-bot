require 'rails_helper'

describe 'coffee_brewing endpoint POST requests' do
  context 'POST /api/v1/coffee_brewing' do
    it 'creates a new brew' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/coffee_brewing',
        text: 'Home Coffee is very good!'
      }
      expect(Brew.count).to eq(0)

      post '/api/v1/coffee_brewing', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      brew = JSON.parse(response.body)

      expect(response).to be_success
      expect(Brew.count).to eq(1)
      expect(Brew.first.location).to eq('Home')
      expect(brew['text']).to eq("Hey #{user.username} - thanks for brewing coffee!")
    end

    it 'creates a new brew' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/coffee_brewing',
        text: 'Home Coffee is very good!'
      }
      expect(Brew.count).to eq(0)

      post '/api/v1/coffee_brewing', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      brew = JSON.parse(response.body)

      expect(response).to be_success
      expect(Brew.count).to eq(1)
      expect(Brew.first.location).to eq('Home')
      expect(brew['text']).to eq("Hey #{user.username} - thanks for brewing coffee!")
    end

    it 'creates a new brew with only a location' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/coffee_brewing',
        text: 'Home'
      }
      expect(Brew.count).to eq(0)

      post '/api/v1/coffee_brewing', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      brew = JSON.parse(response.body)

      expect(response).to be_success
      expect(Brew.count).to eq(1)
      expect(Brew.first.location).to eq('Home')
      expect(brew['text']).to eq("Hey #{user.username} - thanks for brewing coffee!")
    end

    it 'creates a new brew without a location' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        team_id: team.id,
        team_domain: team.team_name,
        user_id: user.id,
        user_name: user.username,
        command: '/coffee_brewing',
        text: ''
      }
      expect(Brew.count).to eq(0)

      post '/api/v1/coffee_brewing', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'}

      brew = JSON.parse(response.body)

      expect(response).to be_success
      expect(Brew.count).to eq(1)
      expect(Brew.first.location).to eq(team.team_name)
      expect(brew['text']).to eq("Hey #{user.username} - thanks for brewing coffee!")
    end

    it 'does not create a new brew without a team' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        user_id: user.id,
        user_name: user.username,
        command: '/coffee_brewing',
        text: ''
      }
      expect(Brew.count).to eq(0)

      expect { post '/api/v1/coffee_brewing', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'} }.to raise_error(NoMethodError)
    end

    it 'does not create a new brew without a user' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = {
        user_id: user.id,
        user_name: user.username,
        command: '/coffee_brewing',
        text: ''
      }
      expect(Brew.count).to eq(0)

      expect { post '/api/v1/coffee_brewing', params: data.to_json, headers: { 'CONTENT_TYPE' => 'application/json'} }.to raise_error(NoMethodError)
    end
  end
end
