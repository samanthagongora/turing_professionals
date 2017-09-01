require "rails_helper"

RSpec.feature "User views all companies" do
  scenario "they see picture, name, picture, number of members associated, industry, and office locations for each company" do
    # user = create(:user)
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    co_1, co_2 = create_list(:company, 2)
    visit companies_path

    expect(page).to have_content(co_1.name)
    expect(page).to have_xpath("//img[@src='#{co_1.image_url}']")
    expect(page).to have_content(co_1.industry)
    expect(page).to have_content(co_1.locations)
    # number of members associated - need user table
    expect(page).to have_content(co_2.name)
    expect(page).to have_xpath("//img[@src='#{co_2.image_url}']")
    expect(page).to have_content(co_2.industry)
    expect(page).to have_content(co_2.locations)
    # number of members associated - need user table
    
  end
end
