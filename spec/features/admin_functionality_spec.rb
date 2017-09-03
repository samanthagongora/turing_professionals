require 'rails_helper'

RSpec.feature "Admin user visits admin dashboard page and" do
  scenario "can deactivate and reactivate a user" do
    # As an admin
    user = build(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit the admin dashboard page
    visit '/admin/dashboard'
    # And I click on the users tab
    click_on("Users")
    # I should see a list of all the users in the system
    default_users = create_list(:user, 5)
    expect(page).to have_content default_users.first.first_name
    expect(page).to have_content default_users.last.first_name
    # And when I click “Deactivate” on a user
    click_on("Deactivate", match: :first)
    # That user’s profile should say “deactivated”
    expect(page).to have_content("Deactivated")
    # And when I click “Reactivate” on a user
    click_on("Reactivate")
    # That user’s profile should say “Activated"
      #within some css do
        #expect page to have content Activated
      #end
  end

  context "deactivates a user and" do
    scenario "that user can no longer post content" do
      # As an admin
      # When I visit the admin dashboard page
      # And click “Deactivate” on a user
      # That user should not be able to post content on a company page
    end
  end

  context "can delete a company and" do
    scenario "that company's content no longer appears" do
      # As an admin
      user = build(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # When I visit the admin dashboard page
      visit admin_dashboard_path
      # And I click on the companies tab
      within("#companies-tab") do
        click_link("Companies")
      end
      # I should see a list of all the companies in the system
      companies = create_list(:company, 5)
      expect(page).to have_content companies.first.name
      expect(page).to have_content companies.last.name
      # And when I click “Delete” on a company
      click_on("Delete", match: :first)
      # It should be removed from the database and the view
      expect(Company.where(name: companies.first.name)).to_not exist
      # And its comments, interview questions, etc. should also be removed

    end
  end
end
