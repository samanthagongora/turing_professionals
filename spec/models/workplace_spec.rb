require 'rails_helper'

RSpec.describe Workplace, type: :model do
  describe "validations" do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:company_id)}
    it {should validate_presence_of(:position)}
    it {should validate_presence_of(:status)}
  end
  describe "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:company)}
  end

end
