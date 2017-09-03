require 'rails_helper'

RSpec.describe "Regular user changes URL to '/admin/dashboard' and" do
  scenario "is shown 404 page; cannot see admin content" do
    # As a registered, authenticated, default user
    # When I visit '/admin/dashboard'
    # I should be given a 404 page
    # And I should not see a list of all users with deactivate buttons
    # And I should not see a list of all companies with delete buttons
  end
end
