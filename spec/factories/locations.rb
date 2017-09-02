FactoryGirl.define do
  factory :location do
    sequence :city {|n| "City #{n}"}
    sequence :state {|n| "State#{n}"}
  end
end
