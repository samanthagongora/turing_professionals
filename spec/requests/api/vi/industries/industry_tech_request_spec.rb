require 'rails_helper'

describe 'tech stack by industry api' do
  it "sends a list of technologies for the passed-in industry with a count of how many companies are utilizing them" do
    companies = create_list(:company, 5)
    technologies = create_list(:technology, 8)
    tech_stacks = create_list(:tech_stack, 10, company: companies.sample(1).first, technology: technologies.sample(1).first)
    industries = create_list(:industry, 10)
    industries.each do |industry|
      industry.companies << companies.sample(rand(1..10))
    end
    technologies.each do |technology|
      technology.companies << companies.sample(rand(1..10))
    end

    get "/api/v1/industry_tech?name=#{industries.first.name}"

    expect(response).to be_success
    results = JSON.parse(response.body)
    expect(results.class).to eq Hash
  end

end
