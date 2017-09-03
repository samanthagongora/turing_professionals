require 'rails_helper'

feature "registered user can log out" do
  scenario "user logs out" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"

    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Join a community with like-minded professionals to grow your career!")
  end
end
