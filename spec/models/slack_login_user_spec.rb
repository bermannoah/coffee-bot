require 'rails_helper'

describe SlackLoginUser, type: :model do
  context 'validations' do
    it 'is valid with a username' do
      slack_user = Fabricate(:slack_login_user, username: "hunter2")
      
      expect(slack_user).to be_valid
    end
    
    it 'is valid with a slack_uid' do
      slack_user = Fabricate(:slack_login_user, slack_uid: 231313123)
      
      expect(slack_user).to be_valid
    end

    it 'is valid with a slack_access_token' do
      slack_user = Fabricate(:slack_login_user, slack_access_token: 3121231232132132131312312313)
      
      expect(slack_user).to be_valid
    end

    it 'is invalid without a username' do
      slack_user = SlackLoginUser.new(slack_uid: 12, slack_access_token: 1212)
      
      expect(slack_user).to be_invalid
    end

    it 'is invalid without a slack_uid' do
      slack_user = SlackLoginUser.new(username: "Arthur", slack_access_token: 1212)
      
      expect(slack_user).to be_invalid
    end

    it 'is invalid without a slack_access_token' do
      slack_user = SlackLoginUser.new(username: "Arthur", slack_uid: 1212)
      
      expect(slack_user).to be_invalid
    end
  end
  
  context 'uniqueness' do
    it 'has a unique slack_uid' do
      slack_user_1 = SlackLoginUser.new(username: "Arthur", slack_uid: 1212)
      slack_user_2 = SlackLoginUser.new(username: "Arthur", slack_uid: 1212)

      expect(slack_user_2).to be_invalid
    end
  end
end