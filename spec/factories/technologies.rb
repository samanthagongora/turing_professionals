FactoryGirl.define do
  factory :technology do
    sequence :name {|n| "Java #{n}"}
  end
end
