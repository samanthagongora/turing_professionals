require "rails_helper"

RSpec.feature "User visits member index" do
  scenario "can favorite a member" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit dashboard_path
    click_on "Members"

    within (".user-card-#{user_2.id}") do
      click_on('.glyphicon-star-empty')
    end

    expect(user_1.favorite_users).to eq(user_2)
  end
end
