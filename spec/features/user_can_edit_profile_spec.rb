require 'rails_helper'

RSpec.feature "User can edit profile", type: :feature do
  # scenario "user makes changes successfully" do
    context "using a browser", :js => true do
    user = create(:user, first_name: "Jyll", last_name: "Justamond")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit profile_path(user)

    click_on "Update"

    expect(current_path).to eq(profile_path(user))

    # within('.modal') do
      fill_in "First name", with: "New first name"
      fill_in "Last name", with: "New last name"

      click_on "Update User"
      find("#header h1", :visible => true).text.should == "New first name"
    # end

    expect(current_path).to eq("/profile.1")
    within('#header h1') do
      expect(page).to have_content("New first name")
      expect(page).to have_content("New last name")
      expect(page).to_not have_content("Jyll")
      expect(page).to_not have_content("Justamond")
    end
  end
  end

