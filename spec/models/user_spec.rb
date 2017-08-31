require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it "Attributes" do
      it {should validate_presence_of(:auth_token_linkedin)}
      it {should validate_uniqueness_of(:auth_token_linkedin)}
      it {should validate_presence_of(:uid)}
      it {should validate_uniqueness_of(:uid)}
      it {should validate_presence_of(:first_name)}
      it {should validate_presence_of(:last_name)}
      it {should validate_presence_of(:email)}
      it {should validate_uniqueness_of(:email)}
      it {should validate_presence_of(:summary)}
      it {should validate_presence_of(:linkedin_url)}
      it {should validate_uniqueness_of(:linkedin_url)}
      it {should validate_uniqueness_of(:twitter)}
      it {should validate_presence_of(:image_url)}
      it {should validate_presence_of(:slack)}
      it {should validate_uniqueness_of(:slack)}
      it {should validate_presence_of(:github)}
      it {should validate_uniqueness_of(:github)}
      it {should validate_presence_of(:cohort)}
    end
  end

end
