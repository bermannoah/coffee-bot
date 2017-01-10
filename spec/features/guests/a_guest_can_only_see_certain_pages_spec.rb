require 'rails_helper' 

describe "A guest user visits the site" do
  context "a guest can see certain pages" do
    scenario "they see how-to info about the app" do
      visit root_path
      
      expect(page).to have_content("List of Coffee-Bot commands:")
      expect(page).to have_content("/coffee_brewing")
      expect(page).to have_content("/coffee_brewing #how")
      expect(page).to have_content("/last_brewed")
      expect(page).to have_content("If you're installing this for the first time")
      expect(page).to have_content("Coffee Information")
    end

    scenario "they see the sign in with slack button" do
      visit root_path
            
      expect(page).to have_css("img[alt='Sign in with Slack']")
      expect(page).to_not have_content("Logout")
    end

    scenario "they see coffee brewing info" do
      visit coffee_info_path
            
      expect(page).to have_content("More coming soon...")
      expect(page).to have_content("For now, here's a guide to describing coffee flavor.")
      expect(page).to have_css("img[alt='Scaa flavorwheel']")
    end
  end
  
  context "a guest cannot see certain pages" do
    scenario "they can't visit the list of brews" do
      visit list_of_brews_path
      
      expect(page).to have_http_status(404)
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to have_content("You may have mistyped the address or the page may have moved.")
    end

    scenario "they can't visit the specific instructions for brewing" do
      visit how_to_brew_path
      
      expect(page).to have_http_status(404)
      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to have_content("You may have mistyped the address or the page may have moved.")
    end

    scenario "they can't see brews on the index page" do
      visit root_path
      
      expect(page).to have_http_status(200)
      expect(page).to have_content("Welcome to ☕️ Coffee-Bot!")
      expect(page).to_not have_content("Most recent coffee brew:")
    end
  end
end