require 'rails_helper'

RSpec.describe UserLocation, type: :model do
  describe "validations" do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:location_id)}
  end
end
