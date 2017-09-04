require 'rails_helper'

feature 'User visits profile page and clicks update' do
  scenario 'they see their updated information' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path

      click_button "UPDATE"

      fill_in "user[first_name]", with: "FirstName"
      fill_in "user[last_name]",  with: "LastName"
      fill_in "user[email]",      with: "Email@example.com"
      fill_in "user[headline]",   with: "New Headline"
      fill_in "user[summary]",    with: "New Summary"
      fill_in "user[twitter]",    with: "Tweet"
      fill_in "user[slack]",      with: "Slacker"
      fill_in "user[github]",     with: "Octodex"
      fill_in "user[locations_attributes][0][city]", with: "Denver"
      fill_in "user[locations_attributes][0][state]", with: "CO"

      click_on "Submit"

      new_user = User.first

      expect(current_path).to eq(user_path(user))

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(new_user)

      visit profile_path

      expect(page).to have_content("FirstName")
      expect(page).to have_content("LastName")
      expect(page).to have_content("Email@example.com")
      expect(page).to have_content("New Headline")
      expect(page).to have_content("New Summary")
      expect(page).to have_content("Tweet")
      expect(page).to have_content("Slacker")
      expect(page).to have_content("Octodex")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
  end
end
