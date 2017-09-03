require 'rails_helper'

RSpec.describe "Admin deletes a company and" do
  scenario "that company's content no longer appears" do
    # As an admin
    companies = create_list(:company, 5)
    user = build(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # When I visit the admin dashboard page
    visit admin_dashboard_path
    # And I click on the companies tab
    within("#companies-tab") do
      click_link("Companies")
    end
    # I should see a list of all the companies in the system
    expect(page).to have_content companies.first.name
    expect(page).to have_content companies.last.name
    # And when I click “Delete” on a company
    click_on("Delete", match: :first)
    # It should not appear in the companies index
    click_on "Companies", match: :first
    expect(page).to_not have_content companies.first.name
  end
end
