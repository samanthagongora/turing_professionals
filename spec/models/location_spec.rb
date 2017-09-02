require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "validations" do
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
  end

  describe "relationships" do
    it {should have_many(:office_locations)}
    it {should have_many(:companies)}
  end
end
