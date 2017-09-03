FactoryGirl.define do
  factory :interview_question do
    sequence :description {|n| "What's your favority color #{n}?"}
    company
  end
end
