require "rails_helper"

RSpec.feature "User visits member index" do
  scenario "they see all members" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)


    # click_on "Members"
    visit members_path

    expect(current_path).to eq("/members")
    expect(page).to have_css(".member", count: 3)
    within first(".member") do
      expect(page).to have_css(".image_url")
      expect(page).to have_css(".name")
      expect(page).to have_css(".location")
      expect(page).to have_css(".company")
      expect(page).to have_css(".cohort")
    end
    expect(page).to have_css('.glyphicon-star', count: 3)
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
