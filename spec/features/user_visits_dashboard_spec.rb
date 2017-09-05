require 'rspec_helper'

feature "user visits dashboard" do
  scenario "it can see its favorite users" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    co_1, co_2 = create_list(:company, 2)
  end
end


# When I successfully log in to our site
# I should be redirected to my dashboard page
# And I should see widgets for my connections, my companies, and my profile
