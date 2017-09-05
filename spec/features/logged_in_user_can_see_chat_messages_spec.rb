require "rails_helper"

RSpec.feature "User visits member index", js: true do
  scenario "they see all members" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/messages'

    fill_in 'message[content]', with: 'hello, How r u?'

    input = find('input#submit.submit')
    input.base.invoke('13', false, false, false, false, 13, nil)

    within('#messages-table') do
      expect(page).to have_content('hello, How r u?')
    end
  end
end
