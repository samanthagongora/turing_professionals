require 'rails_helper'

feature "registered user updates account information" do
  scenario "app uses linkedin profile to update user information" do
    mock_auth_hash

    user = create(:user)
    location = create(:location)
    user_location = create(:user_location, user_id: user.id, location_id: location.id)


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit profile_path

    click_on "Authorize app to use your Linkedin information"

    expect(current_path).to eq("/profile")
    expect(page).to have_content("mock")
    expect(page).to have_content("user")
  end
end
