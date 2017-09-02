require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context "associations" do
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
end
