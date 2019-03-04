require 'rails_helper'

describe SessionsController, type: :controller do
  context 'create' do
    scenario 'with a stubbed logged in user there is a user' do
      user = Fabricate(:slack_login_user)
      stub_logged_in_user(user)

      expect(SlackLoginUser.count).to eq(1)
    end
  end

  context 'destroy' do
    scenario 'user no longer has authentication and is redirected' do
      user = Fabricate(:slack_login_user)
      stub_logged_in_user(user)

      expect(response).to have_http_status(200)

      post :destroy

      expect(response).to have_http_status(302)
    end
  end
end
