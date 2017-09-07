RSpec.feature "User visits member index" do
  before :each do
    @user_1, @user_2, @user_3, @user_4 = create_list(:user, 4)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    create(:favorite, user: @user_1, favoritable: @user_2)
    create(:favorite, user: @user_1, favoritable: @user_3)
  end

  it "they can filter by location and company" do
    visit root_path
    click_on "Members"

    find("body > div > div > div > div.col-xs-6.col-sm-4.user-card-#{@user_2.id} > div > a > span").click
    find("body > div > div > div > div.col-xs-6.col-sm-4.user-card-#{@user_3.id} > div > a > span").click

    click_on "Favorites"

    expect(page).to have_css(".user-card-#{@user_2.id}")
    expect(page).to have_css(".user-card-#{@user_3.id}")
    expect(page).to_not have_css(".user-card-#{@user_4.id}")
  end
end
