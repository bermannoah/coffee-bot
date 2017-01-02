require 'rails_helper' 

describe "A guest user visits the site" do
  context "a guest can see the main page" do
    scenario "they see relevant content" do
      visit root_path
      
      expect(page).to have_content("List of Coffee-Bot commands:")
      expect(page).to have_content("/coffee_brewing")
      expect(page).to have_content("/coffee_brewing #how")
      expect(page).to have_content("/last_brewed")
      expect(page).to have_content("If you're installing this for the first time")
      
      expect(page).to have_css("img[alt='Sign in with Slack']")

      expect(page).to_not have_content("Logout")
    end
  end
end