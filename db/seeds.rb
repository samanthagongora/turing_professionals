require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

10.times do
  Industry.create(name: Faker::Job.field)
end

10.times do
  Location.create(city: Faker::Address.city, state: Faker::Address.state_abbr)
end

10.times do |n|
  co = Company.create(name: Faker::Company.name, website: "google.com", image_url: Faker::Company.logo)
  co.industries << Industry.all[n..n+3]
  co.locations << Location.all[n..n+3]
end

10.times do |n|
  user = User.create(username: "username#{n}", password: "password", summary: Faker::Lorem.paragraph, headline: Faker::Lorem.sentence, first_name: Faker::Name.name)
  Workplace.create(user_id: user.id, company: Company.first, position: Faker::Job.title, status: 0)
end

2.times do |n|
  user = User.create(username: "username2#{n}", password: "password")
  Workplace.create(user_id: user.id, company: Company.second, position: Faker::Job.title, status: 0)
end
