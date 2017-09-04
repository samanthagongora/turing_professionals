require "rails_helper"

RSpec.feature "User visits company index" do
  before :each do
    @user_1, @user_2, @user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    @co_1, @co_2, @co_3 = create_list(:company, 3)
    @ind_1, @ind_2, @ind_3 = create_list(:industry, 3)
    @city_1, @city_2, @city_3 = create_list(:location, 3)
    @co_1.industries << [@ind_1, @ind_2]
    @co_2.industries << [@ind_1, @ind_3]
    @co_3.industries << [@ind_1, @ind_2, @ind_3]
    @co_1.locations << [@city_3]
    @co_2.locations << [@city_1, @city_2]
    @co_3.locations << [@city_1, @city_2, @city_3]
    create(:workplace, user_id: @user_1.id, company: @co_1)
    create(:workplace, user_id: @user_2.id, company: @co_1)
    create(:workplace, user_id: @user_1.id, company: @co_2)
    create(:workplace, user_id: @user_2.id, company: @co_2)
    create(:workplace, user_id: @user_3.id, company: @co_2)
  end

  it "they see all companies" do
    visit companies_path

    within(".company-#{@co_1.id}") do
      expect(page).to have_content(@co_1.name)
      expect(page).to have_xpath("//img[@src='#{@co_1.image_url}']")
      expect(page).to have_content(@ind_1.name)
      expect(page).to have_content(@ind_2.name)
      expect(page).to have_content("#{@city_3.city}, #{@city_3.state}")
      expect(page).to have_content("Members Who Have Worked Here: 2")
    end
    within(".company-#{@co_2.id}") do
      expect(page).to have_content(@co_2.name)
      expect(page).to have_xpath("//img[@src='#{@co_2.image_url}']")
      expect(page).to have_content(@ind_1.name)
      expect(page).to have_content(@ind_3.name)
      expect(page).to have_content("#{@city_1.city}, #{@city_1.state}")
      expect(page).to have_content("#{@city_2.city}, #{@city_2.state}")
      expect(page).to have_content("Members Who Have Worked Here: 3")
    end
  end

  it "they can filter by location and industry" do
    visit companies_path

    find('.cities').click

    check("city-#{@city_1.id}")
    check("industry-#{@ind_1.id}")
    click_on "Filter"

    expect(page).to have_content @co_2.name
    expect(page).to have_content @co_3.name
    expect(page).to_not have_content @co_1.name
  end
end
