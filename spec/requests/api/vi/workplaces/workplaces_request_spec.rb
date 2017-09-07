require 'rails_helper'

describe 'technologies api' do
  it "sends job titles and number of users currently holding title" do
    create_list(:workplace, 3, title: "Developer")
    create_list(:workplace, 5, title: "Junior Developer")
    create_list(:workplace, 2, title: "Senior Developer")

    get "/api/v1/workplaces/title_counts"

    expect(response).to be_success
    titles = JSON.parse(response.body)
    
    expect(titles.count).to eq(3)
    expect(titles.first["title"]).to eq("Junior Developer")
    expect(titles.last["title"]).to eq("Senior Developer")
    expect(titles.first["count"]).to eq(5)
    expect(titles.last["count"]).to eq(2)
  end
end
