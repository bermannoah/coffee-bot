require 'rails_helper'

describe "coffee endpoint" do
  context 'POST /api/v1/coffee_brewing' do
    it 'creates a new coffee' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)

      post "/api/v1/coffee_brewing"
      
      brew = JSON.parse(response.body)
      binding.pry
      expect(response).to be_success
    end
  end
end