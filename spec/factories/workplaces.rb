FactoryGirl.define do
  factory :workplace do
    employed_user
    company
    position "MyString"
    status 0
  end
end
