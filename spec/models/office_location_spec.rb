require 'rails_helper'

RSpec.describe OfficeLocation, type: :model do
  describe "validations" do
    it {should validate_presence_of(:location_id)}
    it {should validate_presence_of(:company_id)}
  end
end
