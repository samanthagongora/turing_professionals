require 'rails_helper'

RSpec.describe CompanyIndustry, type: :model do
  describe "validations" do
    it {should validate_presence_of(:company_id)}
    it {should validate_presence_of(:industry_id)}
  end
end
