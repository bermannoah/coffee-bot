require 'rails_helper'

describe ApplicationHelper do
  context "if most recent brew is nil" do
    it "returns false" do
      @most_recent_brew == nil
      expect(helper.show_coffee_on_index_page?).to be false
    end
  end
  
  context "if current user is nil" do
    it "returns false" do
      brew = Fabricate(:brew)
      @most_recent_brew = brew
      session[:user_id] == nil
      
      expect(helper.show_coffee_on_index_page?).to be false
    end
  end

  context "if there is a brew and it isn't the user's team's brew" do
    it "returns false" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew = Fabricate(:brew)

      stub_logged_in_user(user)
      current_user = user
      
      expect(helper.show_coffee_on_index_page?).to be false
    end
  end

  context "if there is a brew and there is a session but something else doesn't match" do
    it "returns false" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew = Fabricate(:brew)
      @most_recent_brew = brew
      session[:user_id] = user.id

      expect(helper.show_coffee_on_index_page?).to be false
    end
  end

  context "if there is a brew and it is the user's team's brew" do
    it "returns true" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew = Brew.new(user_name: user.username, location: "Home", description: "There", team_id: user.team_id)
      @most_recent_brew = brew
      session[:user_id] = user.id

      expect(helper.show_coffee_on_index_page?).to be true
    end
  end
end