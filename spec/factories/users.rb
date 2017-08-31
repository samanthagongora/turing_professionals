FactoryGirl.define do
  factory :user do

    role 0

    sequence :auth_token_linkedin do |x|
      "AuthToken#{x}"
    end

    sequence :uid do |x|
      "UID#{x}"
    end

    first_name "Spongebob"
    last_name "Squarepants"

    sequence :email do |x|
      "pineapple#{x}@underthesea.com"
    end

    headline "World's Best Employee"
    summary "An overly enthusatic sentient sponge"
    linkedin_url "www.nick.com/spongebob-squarepants/"
    image_url "http://az616578.vo.msecnd.net/files/2016/07/09/6360363022594514001256241258_SBSB.png"
    resume "resume.doc"
    location
    twitter "https://twitter.com/SpongeBob"
    slack "@spongebob"
    github "spongebob"
    cohort "1705 BE"
  end
end
