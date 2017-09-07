require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
  end

  context "relationships" do
    it {should have_many(:locations)}
    it {should have_many(:technologies)}
    it {should have_many(:user_technologies)}
    it {should have_many(:messages)}
  end

  context "class methods" do
    it ".filter returns users matching companies and locations" do
      user_1, user_2, user_3 = create_list(:user, 3)
      loc_1, loc_2, loc_3 = create_list(:location, 3)
      co_1, co_2, co_3 = create_list(:company, 3)
      user_1.locations << [loc_1, loc_2, loc_3]
      user_2.locations << [loc_1, loc_2]
      user_3.locations << [loc_1]
      create(:workplace, user_id: user_1.id, company: co_1)
      create(:workplace, user_id: user_1.id, company: co_2)
      create(:workplace, user_id: user_1.id, company: co_3)
      create(:workplace, user_id: user_2.id, company: co_1)
      create(:workplace, user_id: user_2.id, company: co_2)
      create(:workplace, user_id: user_3.id, company: co_1)

      params = {location_ids: [loc_1.id, loc_3.id], company_ids: [co_2.id, co_3.id]}
      expect(User.filter(params).to_a).to include user_1, user_2
    end
  end
end
