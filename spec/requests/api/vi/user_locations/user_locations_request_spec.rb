require 'rails_helper'

describe 'user locations api' do
  it "sends a list of locations where users have lived with a count of how many users have lived there" do
    users = create_list(:user, 50, cohort: "1705 FE")
    user_locations = create_list(:location, 25)

    users.each do |user|
      user.locations << user_locations.sample(rand(1..10))
    end

    get "/api/v1/user_locations/everywhere"

    expect(response).to be_success
    results = JSON.parse(response.body)
    expect(results.count).to eq 25
    expect(results.class).to eq Hash
  end
end
