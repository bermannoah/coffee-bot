require 'rails_helper'

describe Brew, type: :model do
  context 'relationships' do
    it { should belong_to(:team) }
  end
end