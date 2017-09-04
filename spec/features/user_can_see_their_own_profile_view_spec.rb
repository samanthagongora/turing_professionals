require 'rails_helper'

RSpec.feature "User can see profile", type: :feature do
  scenario "user views profile" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit profile_path(user)

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.headline)
    expect(page).to have_content(user.summary)
    expect(page).to have_content(user.image_url)
    expect(page).to have_content(user.resume)
    expect(page).to have_content(user.twitter)
    expect(page).to have_content(user.slack)
    expect(page).to have_content(user.github)
  end
end