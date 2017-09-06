require 'rails_helper'

describe 'technologies api' do
  it "sends the most 10 most popular technologies with count of frontend and backend users" do
    technologies = create_list(:technology, 12)
    users = create_list(:user, 3, cohort: "1705 FE")
    users.each_with_index do |user, n|
      user.technologies << technologies[0..(8 + n)]
    end
    user_4 = create(:user, cohort: "1705 BE")
    user_4.technologies << technologies[2]

    get "/api/v1/technologies/most_popular"

    expect(response).to be_success

    techs = JSON.parse(response.body)["data"]
    expect(techs.count).to eq(10)
    expect(techs.first["name"]).to eq(technologies[0].name)
    expect(techs.last["name"]).to eq(technologies[9].name)
    expect(techs.first["front_end_users"]).to eq("3")
    expect(techs.first["back_end_users"]).to eq("1")
  end
end
