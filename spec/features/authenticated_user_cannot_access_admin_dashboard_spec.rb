require 'rails_helper'

RSpec.describe "Regular user changes URL to '/admin/dashboard' and" do
  scenario "is shown 404 page; cannot see admin content" do
    # As a registered, authenticated, default user
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit '/admin/dashboard'
    visit admin_dashboard_path
    # I should be given a 404 page
    expect(page).to have_content("The page you were looking for doesn't exist.")
    # And I should not see a list of all users with deactivate buttons
    expect(page).to_not have_content("Deactivate")
    # And I should not see a list of all companies with delete buttons
    expect(page).to_not have_content("Delete")
  end
end
