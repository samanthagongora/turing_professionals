FactoryGirl.define do
  factory :contact do
    sequence :name {|n| "Bob #{n}"}
    sequence :title {|n| "Manager #{n}"}
    sequence :email {|n| "bob#{n}@gmail.com"}
    company
  end
end
