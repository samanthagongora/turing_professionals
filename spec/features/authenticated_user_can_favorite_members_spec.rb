require "rails_helper"

RSpec.feature "User can favorite and unfavorite a member", js: true do
  scenario "when visiting member index" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit users_path

    find("body > div > div > div > div.col-xs-6.col-sm-4.user-card-#{user_2.id} > div > a > span").click

    within(".user-card-#{user_2.id}") do
      expect(page).to_not have_css(".glyphicon-star-empty")
    end
    expect(user_1.favorite_users).to eq([user_2])

    find("body > div > div > div > div.col-xs-6.col-sm-4.user-card-#{user_2.id} > div > a > span").click

    within(".user-card-#{user_2.id}") do
      expect(page).to have_css(".glyphicon-star-empty")
    end
    expect(user_1.reload.favorite_users).to be_empty
  end
end
