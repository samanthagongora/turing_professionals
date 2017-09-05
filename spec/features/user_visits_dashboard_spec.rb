require 'rails_helper'

feature "user visits dashboard" do
  scenario "it can see its favorite users and companies" do
    user_1, user_2, user_3 = create_list(:user, 3)
    co_1, co_2 = create_list(:company, 2)
    question_1, question_2 = create_list(:interview_question, 2)

    user_1.favorite_companies << co_1
    user_1.favorite_users << user_2

    co_1.interview_questions << question_1

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    visit '/dashboard'

    expect(page).to have_content(co_1.name)
    expect(page).to_not have_content(co_2.name)
    expect(page).to have_content(user_1.username)
    expect(page).to have_content(user_2.username)
    expect(page).to_not have_content(user_3.username)
    expect(page).to have_css(".my-companies")
    expect(page).to have_css(".my-connections")
    expect(page).to have_content("My Items")
    expect(page).to have_content("My Workplaces")
    expect(page).to have_content("Dashboard")
  end
end
