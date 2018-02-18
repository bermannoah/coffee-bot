require 'rails_helper'

describe Team, type: :model do
  context 'relationships' do
    it { should have_many(:brews) }
  end
end
