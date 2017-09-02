require 'rails_helper'

feature "registered user updates account information" do
  scenario "app uses linkedin profile to update user information" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"

    click_on "Authorize app to use your Linkedin information"

    # fill_in "Email Address", with: OmniAuth.first_name
    # fill_in "Password", with: OmniAuth.last_name

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("mock")
    expect(page).to have_content("user")
  end
end
