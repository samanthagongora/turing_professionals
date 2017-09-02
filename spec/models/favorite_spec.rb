require "rails_helper"

RSpec.describe Favorite, type: :model do
  context "associations" do
    it { is_expected.to respond_to :user }
    it { is_expected.to respond_to :favoritable }
    it should have_many :favoritables
    it should belong_to :user

  context 'validations' do
    it {should validate_presence_of(:favoritable_type)}
    it {should validate_presence_of(:favoritable_id)}
    it {should validate_presence_of(:user_id)}

    end
  end
end
