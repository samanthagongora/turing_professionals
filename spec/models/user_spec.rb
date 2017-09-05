require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
  end

  context "relationships" do
    it {should have_many(:locations)}
    it {should have_many(:workplaces)}
    it {should have_many(:favorites)}
    it {should have_many(:user_locations)}
  end
end
