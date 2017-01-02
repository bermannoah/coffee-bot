require 'rails_helper'

describe SlackLoginUser, type: :model do
  context 'validations' do
    it 'is valid with a username' do
      slack_user = Fabricate(:slack_login_user, username: "hunter2")
      
      expect(slack_user).to be_valid
    end
  end
end