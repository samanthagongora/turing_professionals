require "rails_helper"

RSpec.feature "User visits member index", js: true do
  scenario "can favorite a member" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit users_path

    find("body > div > div > div > div.col-xs-6.col-sm-4.user-card-#{user_2.id} > div > a > span").click

    expect(user_1.favorite_users).to eq([user_2])
  end
end
