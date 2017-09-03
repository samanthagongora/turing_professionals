require "rails_helper"

RSpec.feature "User visits member index" do
  scenario "they see all members" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit dashboard_path
    click_on "Members"

    expect(current_path).to eq("/users")
    expect(page).to have_css(".panel-body", count: 3)
    within(".member-#{user_1.id}") do
      expect(page).to have_css(".member-index-picture")
      expect(page).to have_css(".member-name")
      expect(page).to have_css(".member-location")
      expect(page).to have_css(".member-company")
      expect(page).to have_css(".member-cohort")
    end
    expect(page).to have_css('.glyphicon-star-empty', count: 3)
  end

  xscenario "they can filter members" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    click_on "Members"
    click_on "Company"
    click_on "City"
    click_on "A-Z"
    click_on "Favorites"
    click_on "Clear Filters"
  end
end
