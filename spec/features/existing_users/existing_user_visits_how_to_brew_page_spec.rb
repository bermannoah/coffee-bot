require 'rails_helper'

describe "Existing user visits how to brew page" do
  context "there is no custom how to brew data yet" do
    scenario "they see a guide for how to brew" do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      
      stub_logged_in_user(user)
        
      visit how_to_brew_path
        
      expect(page).to have_content("How to brew a delicious pot of coffee!")
      expect(page).to have_content("Let everyone know there's a new pot with /coffee_brewing! :)")
      expect(page).to have_content("For more specific advice or for different methods, Coffee-Bot recommends this Blue Bottle guide.")
    end
  end
end