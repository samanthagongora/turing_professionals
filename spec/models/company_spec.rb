require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:website)}
  end

  describe "relationships" do
    it {should have_many(:company_industries)}
    it {should have_many(:industries)}
  end
end
