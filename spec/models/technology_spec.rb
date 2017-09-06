require 'rails_helper'

RSpec.describe Technology, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "class methods" do
    it ".most_popular returns 10 most popular technologies with user counts" do
      technologies = create_list(:technology, 12)
      users = create_list(:user, 3, cohort: "1705 FE")
      users.each_with_index do |user, n|
        user.technologies << technologies[0..(8 + n)]
      end
      user_4 = create(:user, cohort: "1705 BE")
      user_4.technologies << technologies[2]

      expect(Technology.most_popular.to_a.count).to eq(10)
      expect(Technology.most_popular.first["name"]).to eq(technologies[2].name)
      expect(Technology.most_popular.last["name"]).to eq(technologies[9].name)
      expect(Technology.most_popular.first["front_end_users"]).to eq(3)
      expect(Technology.most_popular.first["back_end_users"]).to eq(1)
    end
  end
end
