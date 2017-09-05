require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:website)}
  end

  describe "relationships" do
    it {should have_many(:company_industries)}
    it {should have_many(:industries)}
    it {should have_many(:office_locations)}
    it {should have_many(:locations)}
    it {should have_many(:workplaces)}
    it {should have_many(:employed_users)}
    it {should have_many(:tech_stacks)}
    it {should have_many(:technologies)}
    it {should have_many(:contacts)}
    it {should have_many(:interview_questions)}
  end

  describe "class methods" do
    it ".filter returns companies matching location & industry" do
      co_1, co_2, co_3 = create_list(:company, 3)
      ind_1, ind_2, ind_3 = create_list(:industry, 3)
      location_1, location_2, location_3 = create_list(:location, 3)
      co_1.industries << [ind_1, ind_2, ind_3]
      co_2.industries << [ind_1, ind_2]
      co_1.locations << [location_1, location_2, location_3]
      co_2.locations << [location_1, location_2]

      params_1 = {location_ids: location_1.id, industry_ids: ind_1.id}
      params_2 = {location_ids: location_1.id, industry_ids: ind_3.id}

      expect(Company.filter(params_1).to_a).to eq([co_1, co_2])
      expect(Company.filter(params_2).to_a).to eq([co_1])
    end
  end
end
