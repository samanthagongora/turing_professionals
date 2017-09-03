require 'rails_helper'

RSpec.feature "Admin user visits admin dashboard page and" do
  scenario "can deactivate and reactivate a user" do
    # As an admin
    # When I visit the admin dashboard page
    # And I click on the users tab
    # I should see a list of all the users in the system
    # And when I click “Deactivate” on a user
    # That user’s profile should say “deactivated”
    # And when I click “Reactivate” on a user
    # That user’s profile should say “Activated"
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
      # When I visit the admin dashboard page
      # And I click on the companies tab
      # I should see a list of all the companies in the system
      # And when I click “Delete” on a company
      # It should be removed from the database and the view
      # And its comments, interview questions, etc. should also be removed
    end
  end
end
