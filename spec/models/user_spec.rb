require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
  end

  context "relationships" do
    it {should have_many(:locations)}
  end
end
