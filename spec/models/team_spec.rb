require 'rails_helper'

describe Team, type: :model do
  context 'relationships' do
    it 'has many brews' do
      team = Fabricate(:team)
      
      expect(team).to respond_to(:brews)
    end
  end
end