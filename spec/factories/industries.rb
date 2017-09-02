FactoryGirl.define do
  factory :industry do
    sequence :name {|n| "industry #{n}"}
  end
end
