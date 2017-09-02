FactoryGirl.define do
  factory :favorite do
    user
    favoritable nil
    favoritable_type "User"
  end
end
