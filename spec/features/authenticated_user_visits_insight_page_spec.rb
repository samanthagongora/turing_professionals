require "rails_helper"

RSpec.feature "User clicks on insights in navbar" do
  scenario "they are directed to insights page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    click_on "Insights"

    expect(current_path).to eq("/insights")
    expect(page).to have_content("Insights")
  end
end
