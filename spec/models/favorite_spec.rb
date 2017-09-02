require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "favoritable" do
    it "allows user to have favorite users and companies" do
      create_list(:user, 3)
      create_list(:company, 6)
      create(:favorite, user: User.last, favoritable: Company.first)
      create(:favorite, user: User.last, favoritable: User.first)

      expect(User.count).to eq(3)
      expect(User.last.favorites.count).to eq(2)
      expect(Favorite.first.favoritable_id).to eq(Company.first.id)
      # expect(User.last.favorite_users).to eq([User.first])
      expect(User.first.favorites).to eq([])
    end
  end

  describe "associations" do
    it { is_expected.to respond_to :user }
    it { is_expected.to respond_to :favoritable }
    it { is_expected.to belong_to :favoritable }
    it { is_expected.to belong_to :user }
  end

  context 'validations' do
    it {should validate_presence_of(:favoritable_type)}
    it {should validate_presence_of(:favoritable_id)}
    it {should validate_presence_of(:user_id)}
  end

  context 'class methods' do
    #Favorite.joins(:user).where(user_id: 1).where(favoritable_type: "Company")
  end
end
