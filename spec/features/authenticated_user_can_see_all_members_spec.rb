require "rails_helper"

RSpec.feature "User visits member index" do
  scenario "they see all members" do
    user_1, user_2, user_3 = create_list(:user, 3, :with_workplaces)
    location = create(:location)
    user_1_location = create(:user_location, location_id: location.id, user_id: user_1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit dashboard_path
    click_on "Members"

    expect(current_path).to eq("/users")
    expect(page).to have_css(".thumbnail", count: 3)
    within (".col-xs-6.col-sm-4.user-card-#{user_1.id}") do
      expect(page).to have_content(user_1.image_url)
      expect(page).to have_content(user_1.first_name)
      expect(page).to have_content(user_1.last_name)
      expect(page).to have_link("#{user_1.first_name} #{user_1.last_name}")
      expect(page).to have_content(user_1.location.city)
      expect(page).to have_content(user_1.location.state)
      expect(page).to have_link(user_1.workplaces.first.company.name)
      expect(page).to have_content(user_1.cohort)
      expect(page).to_not have_css('.glyphicon-star-empty')
      expect(page).to_not have_link('Your Profile')
    end

    within (".user-card-#{user_2.id}") do
      expect(page).to have_content(user_2.image_url)
      expect(page).to have_content(user_2.first_name)
      expect(page).to have_content(user_2.last_name)
      expect(page).to have_link("#{user_2.first_name} #{user_2.last_name}")
      expect(page).to have_content(user_2.location.city)
      expect(page).to have_content(user_2.location.state)
      expect(page).to have_link(user_2.workplaces.first.company.name)
      expect(page).to have_content(user_2.cohort)
      expect(page).to have_css('.glyphicon-star-empty')
    end
  end
end
