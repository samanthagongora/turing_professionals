require "rails_helper"

RSpec.feature "User clicks navbar links and" do
  context "is authenticated and" do
    scenario "can access all the pages" do
      # As a registered, authenticated user
      user_1, user_2, user_3 = create_list(:user, 3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
      # When I am on any page in the app
      visit "/"
      # And I click the logo in the navbar
      click_link("Turing Professionals")
      # I am sent to my personal dashboard
      expect(current_path).to eq dashboard_path
      # And I click “Members” in the navbar
      # I am sent to the members index page
      # And I click “Companies” in the navbar
      # I am sent to the companies index page
      # And I click my username in the navbar
      # And I click “Dashboard”
      # I am sent to my personal dashboard
      # And I click my username in the navbar
      # And I click “My Profile”
      # I am sent to my personal profile page
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
