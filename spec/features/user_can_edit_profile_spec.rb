require 'rails_helper'

RSpec.feature "User can edit profile", js: true do
  scenario "user makes changes successfully" do
    user = create(:user, first_name: "Jyll", last_name: "Justamond")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit profile_path(user)

    expect(current_path).to eq(profile_path(user))

    find("button.btn.btn-primary").click
    within('.modal') do
      fill_in "First name", with: "New first name"
      fill_in "Last name", with: "New last name"
    end
    find("input.btn.btn-primary").click
    save_and_open_page
    within('#header h1') do
      expect(page).to have_content("New first name")
      expect(page).to have_content("New last name")
      expect(page).to_not have_content("Jyll")
      expect(page).to_not have_content("Justamond")
    end
  end
end

