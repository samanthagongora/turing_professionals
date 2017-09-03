FactoryGirl.define do
  factory :favorite do
    user
    favoritable_type "User"
    association :favoritable, factory: :company
  end
end
