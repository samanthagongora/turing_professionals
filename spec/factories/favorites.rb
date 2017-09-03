FactoryGirl.define do
  factory :favorite do
    user
    favoritable 1
    favoritable_type "User"
  end
end
