require 'rails_helper'

describe Brew, type: :model do
  context 'relationships' do
    it { should belong_to(:team) }
  end

  context 'methods' do
    it 'returns false for retrieve recent brew if there is no current user' do
      current_user = nil
      expect(Brew.retrieve_recent_brew(current_user)).to be false
    end
  end
end
