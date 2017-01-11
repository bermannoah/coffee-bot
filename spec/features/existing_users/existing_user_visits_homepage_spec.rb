require 'rails_helper'

describe "Existing user visits home page" do
  context "before logging in" do
    scenario "they see the same content as a guest" do
      visit root_path
      
      expect(page).to have_content("List of Coffee-Bot commands:")
      expect(page).to have_content("/coffee_brewing")
      expect(page).to have_content("/coffee_brewing #how")
      expect(page).to have_content("/last_brewed")
      expect(page).to have_content("If you're installing this for the first time")
      expect(page).to have_content("Coffee Information")
    end
  end
  
  context "once they've logged in" do
    scenario "they see content on the homepage specific to them" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew = Fabricate(:brew, team: team, user_name: user.username)
      stub_logged_in_user(user)
      
      visit root_path
      
      expect(page).to have_content("List of Coffee-Bot commands:")
      expect(page).to have_content("Most recent coffee brew:")
      expect(page).to have_content("#{brew.location}")
    end

    scenario "if coffee hasn't been brewed they see a relevant alert" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      stub_logged_in_user(user)
      
      visit root_path
      
      expect(page).to have_content("List of Coffee-Bot commands:")
      expect(page).to have_content("No coffee has been brewed yet. Use the commands below to start logging brews!")
    end

    scenario "they see logged-in only links" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      brew = Fabricate(:brew, team: team, user_name: user.username)
      stub_logged_in_user(user)
      
      visit root_path
      
      expect(page).to have_content("List of Brews")
      expect(page).to have_content("Brewing Instructions")
    end
  end
end