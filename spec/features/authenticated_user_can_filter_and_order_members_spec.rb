require "rails_helper"

RSpec.feature "User visits member index" do
  before :each do
    @user_1, @user_2, @user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    @loc_1, @loc_2, @loc_3 = create_list(:location, 3)
    @co_1, @co_2, @co_3 = create_list(:company, 3)
    @user_1.locations << [@loc_1, @loc_2, @loc_3]
    @user_2.locations << [@loc_1, @loc_2]
    @user_3.locations << [@loc_1]
    create(:workplace, user_id: @user_1.id, company: @co_1)
    create(:workplace, user_id: @user_1.id, company: @co_2)
    create(:workplace, user_id: @user_1.id, company: @co_3)
    create(:workplace, user_id: @user_2.id, company: @co_1)
    create(:workplace, user_id: @user_2.id, company: @co_2)
    create(:workplace, user_id: @user_3.id, company: @co_1)
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
end
