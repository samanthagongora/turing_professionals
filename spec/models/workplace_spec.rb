require 'rails_helper'

RSpec.describe Workplace, type: :model do
  describe "validations" do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:company_id)}
    it {should validate_presence_of(:position)}
    it {should validate_presence_of(:status)}
  end

  describe "relationships" do
    it {should belong_to(:employed_user)}
    it {should belong_to(:company)}
  end

  describe "class methods" do
    it ".title_counts returns titles with count of members currently holding them" do
      create_list(:workplace, 3, position: "Developer")
      create_list(:workplace, 5, position: "Junior Developer")
      create_list(:workplace, 2, position: "Senior Developer")
      create_list(:workplace, 4, position: "Senior Developer", status: "previous")
      create_list(:workplace, 2, position: "Software Developer", status: "previous")

      expect(Workplace.title_counts.to_a.count).to eq(3)
      expect(Workplace.title_counts.first["title"]).to eq("Junior Developer")
      expect(Workplace.title_counts.last["title"]).to eq("Senior Developer")
      expect(Workplace.title_counts.first["count"]).to eq(5)
      expect(Workplace.title_counts.last["count"]).to eq(2)
    end
  end
end
