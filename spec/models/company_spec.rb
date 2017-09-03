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
  end
end
