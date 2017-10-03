require 'rails_helper' 

describe "A guest user visits the site" do
  context "a guest can see certain pages" do
    scenario "they see how-to info about the app" do
      visit root_path
      
      expect(page).to have_content("/coffee_brewing")
      expect(page).to have_content("/kettle_brewing")
      expect(page).to have_content("/last_brewed")
      expect(page).to have_content("GET")
      expect(page).to have_content("coffeebot!")
    end

    scenario "they see coffee brewing info" do
      visit coffee_info_path
            
      expect(page).to have_content("Privacy Policy")
    end
  end  
end