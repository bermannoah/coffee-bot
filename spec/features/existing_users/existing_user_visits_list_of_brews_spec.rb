require 'rails_helper'

describe "Existing user visits list of brews page" do
  context "coffee has not been brewed" do
    scenario "they see an empty page" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      
      stub_logged_in_user(user)
        
      visit list_of_brews_path
        
      expect(page).to have_content("ALL THE BREWS")
      expect(page).to have_content("Brewed By")
      expect(page).to have_content("Location")
      expect(page).to have_content("Time Brewed")
      expect(page).to_not have_content("#{user.username}")
    end
  end
  
  context "coffee has been brewed" do
    scenario "they see a list of brews" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew = Fabricate(:brew, team: team, user_name: user.username)
      
      stub_logged_in_user(user)
        
      visit list_of_brews_path
        
      expect(page).to have_content("ALL THE BREWS")
      expect(page).to have_content("Brewed By")
      expect(page).to have_content("Location")
      expect(page).to have_content("Time Brewed")
      expect(page).to have_content("#{user.username}")
      expect(page).to have_content("#{brew.location}")
    end

    scenario "they do not see other company's brews" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew_1 = Fabricate(:brew, team: team, user_name: user.username)
      brew_2 = Fabricate(:brew)
      
      stub_logged_in_user(user)
        
      visit list_of_brews_path
        
      expect(page).to have_content("#{user.username}")
      expect(page).to have_content("#{brew_1.location}")
      expect(page).to_not have_content("#{brew_2.location}")
    end

    scenario "they see multiple user's brews" do
      team = Fabricate(:team)
      
      user_1 = Fabricate(:slack_login_user, team_id: team.id)
      user_2 = Fabricate(:slack_login_user, team_id: team.id)
      user_3 = Fabricate(:slack_login_user, team_id: team.id)
      
      brew_1 = Fabricate(:brew, team: team, user_name: user_1.username)
      brew_2 = Fabricate(:brew, team: team, user_name: user_2.username)
      brew_3 = Fabricate(:brew, team: team, user_name: user_3.username)
      brew_4 = Fabricate(:brew, team: team, user_name: user_1.username)
      brew_5 = Fabricate(:brew, team: team, user_name: user_1.username)
      brew_6 = Fabricate(:brew, team: team, user_name: user_3.username)
      
      stub_logged_in_user(user_1)
        
      visit list_of_brews_path
        
      expect(Brew.count).to eq(6)
      expect(page).to have_content("#{user_1.username}")
      expect(page).to have_content("#{brew_1.user_name}")
      expect(page).to have_content("#{brew_2.user_name}")
      expect(page).to have_content("#{brew_3.user_name}")
    end
  end
end