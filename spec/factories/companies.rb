FactoryGirl.define do
  factory :company do
    sequence :name {|n| "Company #{n}"}
    image_url "https://pixel.nymag.com/imgs/daily/selectall/2017/08/04/04-google-logo.jpg"
    sequence :website {|n| "www.company#{n}.com"}
  end
end
