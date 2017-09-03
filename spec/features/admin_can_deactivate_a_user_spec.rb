require 'rails_helper'

RSpec.feature "Admin user visits admin dashboard page and" do
  scenario "can deactivate and reactivate a user" do
    # As an admin
    default_users = create_list(:user, 5)
    user = build(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit the admin dashboard page
    visit admin_dashboard_path
    # And I click on the users tab
    click_on("Users")
    # I should see a list of all the users in the system
    expect(page).to have_content default_users.first.username
    expect(page).to have_content default_users.last.username
    # And when I click “Deactivate” on a user
    click_button("Deactivate", match: :first)
    # The button next to the user should say "Activate"
    expect(page).to have_button("Activate")
    # And when I click "Activate" on a user
    click_button("Activate")
    # The button next to the user should say "Deactivate"
    expect(page).to have_button("Deactivate")
    expect(page).to_not have_button("Activate")
  end

  context "deactivates a user and" do
    scenario "that user no longer appears on the members index page" do
      # As an admin
      default_users = create_list(:user, 5)
      user = build(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # When I visit the admin dashboard page
      visit admin_dashboard_path
      click_on("Users")
      # And click “Deactivate” on a user
      click_button("Deactivate", match: :first)
      # That user should not appear on the members index page
      click_on("Members")
      expect(page).to_not have_content default_users.first.first_name
    end
  end
end
