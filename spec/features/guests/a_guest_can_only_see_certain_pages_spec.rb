require 'rails_helper'

describe 'A guest user visits the site' do
  context 'a guest can see certain pages' do
    scenario 'they see how-to info about the app' do
      visit root_path

      expect(page).to have_content('/coffee_brewing')
      expect(page).to have_content('/kettle_brewing')
      expect(page).to have_content('/last_brewed')
      expect(page).to have_content('GET')
      expect(page).to have_content('coffeebot')
    end

    scenario 'they visit the privacy page' do
      visit privacy_path

      expect(page).to have_content('coffeebot')
      expect(page).to have_content('Privacy Policy')
      expect(page).to have_content('hello at coffeebot.coffee')
      expect(page).to have_link('back')
    end

    scenario 'they visit the cookie policy page' do
      visit cookies_path

      expect(page).to have_content('coffeebot')
      expect(page).to have_content('If we update this policy this page will update.')
      expect(page).to have_link('back')
    end
  end
end
