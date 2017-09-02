require 'rails_helper'

RSpec.describe TechStack, type: :model do
  describe "validations" do
    it {should validate_presence_of(:company_id)}
    it {should validate_presence_of(:technology_id)}
  end

  describe "relationships" do
    it {should belong_to(:company)}
    it {should belong_to(:technology)}
  end
end
