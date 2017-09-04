require 'rails_helper'

feature 'new user creates account from homepage' do
  scenario 'and sees their dashboard' do
    user_attributes = build(:user)

    visit "/"

    click_link "Create Account"

    fill_in "user[username]", with: user_attributes.username
    fill_in "user[password]", with: user_attributes.password
    fill_in "user[password_confirmation]", with: user_attributes.password

    click_button "Sign Up"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome, #{user_attributes.username}")
    expect(page).to have_content("Logout")
  end
end
