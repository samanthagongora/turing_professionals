require "rails_helper"

RSpec.feature "User can favorite and unfavorite a company", js: true do
  scenario "when visits company index" do
    company_1, company_2, company_3 = create_list(:company, 3)
    user = create(:user)
    location = create(:location)
    user_location = create(:user_location, user_id: user.id, location_id: location.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit companies_path

    find("body > div > div > div.panel.panel-default.company-#{company_1.id} > div > div > div.col-md-8.text-center > h2 > a.pull-right > span").click

    within(".company-#{company_1.id}") do
      expect(page).to have_css(".glyphicon-star")
    end
    expect(user.favorite_companies).to eq([company_1])

    find("body > div > div > div.panel.panel-default.company-#{company_1.id} > div > div > div.col-md-8.text-center > h2 > a.pull-right > span").click

    within("div.panel.panel-default.company-#{company_1.id}") do
      expect(page).to have_css(".glyphicon-star-empty")
    end
    expect(user.reload.favorite_users).to be_empty
  end

  scenario "when visits company show" do
    company_1, company_2, company_3 = create_list(:company, 3)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/#{company_1.name.parameterize}"

    find("body > div > div.text-center.row > h1 > a.pull-right > span").click

    within("body > div > div.text-center.row > h1") do
      expect(page).to have_css(".glyphicon-star")
    end
    expect(user.favorite_companies).to eq([company_1])

    find("body > div > div.text-center.row > h1 > a.pull-right > span").click

    within("body > div > div.text-center.row > h1") do
      expect(page).to have_css(".glyphicon-star-empty")
    end
    expect(user.reload.favorite_companies).to be_empty
  end
end
