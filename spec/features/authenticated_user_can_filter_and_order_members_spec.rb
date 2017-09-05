require "rails_helper"

RSpec.feature "User visits member index" do
  before :each do
    @user_1 = create(:user, last_name: "B_Member")
    @user_2 = create(:user, last_name: "C_Member")
    @user_3 = create(:user, last_name: "A_Member")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    @loc_1, @loc_2, @loc_3 = create_list(:location, 3)
    @co_1, @co_2, @co_3 = create_list(:company, 3)
    @user_1.locations << [@loc_1, @loc_2, @loc_3]
    @user_2.locations << [@loc_1, @loc_2]
    @user_3.locations << [@loc_1]
    create(:workplace, employed_user: @user_1, company: @co_1)
    create(:workplace, employed_user: @user_1, company: @co_2)
    create(:workplace, employed_user: @user_1, company: @co_3)
    create(:workplace, employed_user: @user_2, company: @co_1)
    create(:workplace, employed_user: @user_2, company: @co_2)
    create(:workplace, employed_user: @user_3, company: @co_1)
  end

  it "they can filter by location and company" do
    visit root_path
    click_on "Members"

    check("location-#{@loc_2.id}")
    check("location-#{@loc_3.id}")
    check("company-#{@co_1.id}")
    check("company-#{@co_2.id}")
    click_on "Filter"

    expect(page).to have_content(@user_1.first_name)
    expect(page).to have_content(@user_2.first_name)
    expect(page).to_not have_content(@user_3.first_name)

    click_on "Clear Filter"

    expect(page).to have_content(@user_1.first_name)
    expect(page).to have_content(@user_2.first_name)
    expect(page).to have_content(@user_3.first_name)
  end

  it "they can sort members alphabetically" do
    visit users_path

    expect(page.all(:css, '.caption')[0]).to have_content("A_Member")
    expect(page.all(:css, '.caption')[1]).to have_content("B_Member")
    expect(page.all(:css, '.caption')[2]).to have_content("C_Member")

    find('.a-z-order').click

    expect(page.all(:css, '.caption')[0]).to have_content("C_Member")
    expect(page.all(:css, '.caption')[1]).to have_content("B_Member")
    expect(page.all(:css, '.caption')[2]).to have_content("A_Member")
  end
end
