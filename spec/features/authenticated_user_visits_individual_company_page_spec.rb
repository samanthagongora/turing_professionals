require "rails_helper"

RSpec.feature "User visits company show page" do
  scenario "they see details for a company with member tab as default" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    co_1, co_2 = create_list(:company, 2)
    ind_1, ind_2, ind_3 = create_list(:industry, 3)
    city_1, city_2, city_3 = create_list(:location, 3)
    co_1.industries << [ind_1, ind_2]
    co_2.industries << [ind_1, ind_3]
    co_1.locations << [city_3]
    co_2.locations << [city_1, city_2]
    create(:workplace, user_id: user_1.id, company: co_1)
    create(:workplace, user_id: user_2.id, company: co_1)
    create(:workplace, user_id: user_1.id, company: co_2)
    create(:workplace, user_id: user_2.id, company: co_2)
    create(:workplace, user_id: user_3.id, company: co_2)
    tech_1, tech_2, tech_3 = create_list(:technology, 3)
    co_1.technologies << [tech_1, tech_2]
    co_2.technologies << [tech_3]
    contact_1, contact_2 = create_list(:contact, 3, company: co_1)
    contact_3, contact_4 = create_list(:contact, 3, company: co_2)


    visit companies_path
    within ".company-#{co_1.id}" do
      click_on "#{co_1.name}"
    end

    expect(current_path).to eq("/#{co_1.name.parameterize}")
    expect(page).to have_content(co_1.name)
    expect(page).to have_selector(:css, "a[href='#{co_1.linkedin_url}']")
    expect(page).to have_selector(:css, "a[href='#{co_1.twitter}']")
    expect(page).to have_link("Website", href: co_1.website)

    within(".overview") do
      expect(page).to have_content("#{city_3.city}, #{city_3.state}")
      expect(page).to_not have_content(city_2.city)
      expect(page).to have_content(ind_1.name)
      expect(page).to have_content(ind_2.name)
      expect(page).to_not have_content(ind_3.name)
      expect(page).to have_content(tech_1.name)
      expect(page).to have_content(tech_2.name)
      expect(page).to_not have_content(tech_3.name)
      expect(page).to have_content(contact_1.name)
      expect(page).to have_content(contact_2.name)
      expect(page).to_not have_content(contact_3.name)
    end
    expect(page).to have_link("Members Who Have Worked Here")
    expect(page).to have_link("Interview Questions")
    within("#co-members-#{co_1.id}") do
      expect(page).to have_content(user_1.first_name)
      expect(page).to have_content(user_2.first_name)
      expect(page).to_not have_content(user_3.first_name)
    end
  end

  scenario "they can add a new contact" do
    user_1 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    co_1 = create(:company)
    contact_1 = create(:contact, company: co_1)

    visit("/#{co_1.name.parameterize}")

    click_on "Add New Contact"
    within(".new-contact-form") do
      fill_in :contact_name, with: "Michael Scott"
      fill_in :contact_title, with: "Regional Manager"
      fill_in :contact_email, with: "michaelscott@dunderm.com"
      click_on "Submit"
    end

    expect(page).to have_content("Michael Scott")
    expect(page).to have_content("Regional Manager")
    expect(page).to have_content("michaelscott@dunderm.com")
    expect(page).to have_content(contact_1.name)
    expect(page).to have_content(contact_1.title)
    expect(page).to have_content(contact_1.email)
  end

  scenario "they click interview questions tab and see interview questions" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    co_1, co_2 = create_list(:company, 2)
    q_1, q_2 = create_list(:interview_question, 2, company: co_1)
    q_3 = create(:interview_question, company: co_2)

    visit "/#{co_1.name.parameterize}"

    click_on "Interview Questions"

    within("#interview-questions-#{co_1.id}") do
      expect(page).to have_content(q_1.description)
      expect(page).to have_content(q_1.created_at.to_formatted_s(:long))
      expect(page).to have_content(q_2.description)
      expect(page).to have_content(q_2.created_at.to_formatted_s(:long))
      expect(page).to_not have_content(q_3.description)
    end
  end

  scenario "they can add interview question" do
    user_1, user_2, user_3 = create_list(:user, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    co_1, co_2 = create_list(:company, 2)
    q_1, q_2 = create_list(:interview_question, 2, company: co_1)
    q_3 = create(:interview_question, company: co_2)

    visit "/#{co_1.name.parameterize}"

    click_on "Interview Questions"

    within("#interview-questions-#{co_1.id}") do
      fill_in "interview_question_description", with: "What's your biggest strength?"
      click_on "Submit"
    end

    within("#interview-questions-#{co_1.id}") do
      expect(page).to have_content("What's your biggest strength?")
      expect(page).to have_content(q_1.description)
      expect(page).to have_content(q_2.description)
      expect(page).to_not have_content(q_3.description)
    end
  end
end
