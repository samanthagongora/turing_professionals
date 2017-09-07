FactoryGirl.define do
   factory :user, aliases: [:employed_user] do

     role 0

     sequence :auth_token_linkedin do |x|
       "AuthToken#{x}"
     end

     sequence :uid do |x|
       "UID#{x}"
     end

     sequence :first_name {|n| "Spongebob #{n}"}
     sequence :last_name {|n| "Squarepants #{n}"}

     sequence :email do |x|
       "pineapple#{x}@underthesea.com"
     end

    headline "World's Best Employee"
    summary "An overly enthusatic sentient sponge"
    linkedin_url "www.nick.com/spongebob-squarepants/"
    image_url "http://az616578.vo.msecnd.net/files/2016/07/09/6360363022594514001256241258_SBSB.png"
    resume "resume.doc"
    twitter "https://twitter.com/SpongeBob"
    slack "@spongebob"
    github "spongebob"
    cohort "1705 BE"
    password "password"
    sequence :username {|n| "username#{n}"}
  end

  trait :with_workplaces do
    after(:create) do |user|
      create(:workplace, employed_user: user)
    end
  end

  trait :with_location do
    after(:create) do |user|
      create(:user_location, user: user)
    end
  end
end
