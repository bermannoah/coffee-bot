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
  end
end