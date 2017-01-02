require 'rails_helper'

describe "coffee endpoint" do
  context 'POST /api/v1/coffee_brewing' do
    xit 'creates a new coffee' do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)

    end
  end
end