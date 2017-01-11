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
  
  context 'with valid slack user info' do
    it 'creates a new user' do
      user_data = {"ok"=>true,
                   "access_token"=>"1234-xxxxxxxxxx",
                   "user"=>{"name"=>"noah",
                            "id"=>"U04NJ71A7"},
                   "team"=>{"id"=>"QWERTY1234",
                            "domain"=>"Problems"}
                  }
      new_user = SlackLoginUser.create_from_slack(user_data)
    
      expect(new_user).to be_an_instance_of(SlackLoginUser)
      expect(new_user).to eq(SlackLoginUser.last)
      expect(new_user.username).to eq("noah")
      expect(new_user.slack_uid).to eq("U04NJ71A7")
    end
  end
  
  context 'with bad authentication data' do
    it 'creates a new user' do
      user_data = {"ok"=>false,
                   "access_token"=>"1234-xxxxxxxxxx",
                   "user"=>{"name"=>"noah",
                            "id"=>"U04NJ71A7"},
                   "team"=>{"id"=>"QWERTY1234",
                            "domain"=>"Problems"}
                  }
      new_user = SlackLoginUser.create_from_slack(user_data)
    
      expect(new_user).to eq(false)
      expect(SlackLoginUser.count).to eq(0)
    end
  end

  context 'with invalid slack user info' do
    it 'does not create a new user' do
      user_data = {"ok"=>true,
                   "access_token"=>"4321-xxxxxxxxxx",
                   "user"=>{"name"=>nil,
                            "id"=>nil},
                   "team"=>{"id"=>"QWERTY12345",
                            "domain"=>"Problems Oh No"}
                  }
      new_user = SlackLoginUser.create_from_slack(user_data)
    
      expect(new_user).to eq(false)
      expect(SlackLoginUser.count).to eq(0)
    end
  end
end