require "rails_helper"

RSpec.feature "User clicks navbar links and" do
  context "is authenticated and" do
    scenario "can access all the pages" do
      # As a registered, authenticated user
      user_1, user_2, user_3 = create_list(:user, 3)
      location = create(:location)
      user_location = create(:user_location, user_id: user_1.id, location_id: location.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
      # When I am on any page in the app
      visit "/"
      # And I click the logo in the navbar
      click_link("Turing Professionals")
      # I am sent to my personal dashboard
      expect(current_path).to eq dashboard_path
      # And I click “Members” in the navbar
      click_link("Members")
      # I am sent to the members index page
      expect(current_path).to eq users_path
      # And I click “Companies” in the navbar
      click_link("Companies")
      # I am sent to the companies index page
      expect(current_path).to eq companies_path
      # And I click my username in the navbar
      click_link("#{user_1.first_name}" + " " + "#{user_1.last_name}")
      # And I click “Dashboard”
      click_link("Dashboard")
      # I am sent to my personal dashboard
      expect(current_path).to eq dashboard_path
      # And I click my username in the navbar
      click_link("#{user_1.first_name}" + " " + "#{user_1.last_name}")
      # And I click “My Profile”
      click_link("See Profile")
      # I am sent to my personal profile page
      expect(current_path).to eq profile_path
    end
  end

  context "is not authenticated and" do
    scenario "can only see login and Turing Professionals link" do
      visit "/"

      expect(page).to have_content("Login")
      expect(page).to_not have_content("Logout")
      expect(page).to have_content("Turing Professionals")
    end

    scenario "is taken to homepage instead of dashboard when clicking Turing Professionals" do
      visit "/"

      click_link("Turing Professionals")

      expect(current_path).to eq root_path
    end
  end
end
