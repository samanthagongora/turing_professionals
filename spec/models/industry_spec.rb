require 'rails_helper'

RSpec.describe Industry, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:company_industries)}
    it {should have_many(:companies)}
  end
end
