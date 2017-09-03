require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:email)}
  end

  describe "relationships" do
    it {should belong_to(:company)}
  end
end
