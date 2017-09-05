require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean


technologies = ["JavaScript", "Java", "Python", "TypeScript", "PHP", "Ruby on Rails", "Elixir", "Rust", "Go", "C#", "Swift"]
technologies.each do |tech|
  Technology.create(name: tech)
end


10.times do
  Industry.create(name: Faker::Job.field)
end

10.times do
  Location.create(city: Faker::Address.city, state: Faker::Address.state_abbr)
end

10.times do |n|
  co = Company.create(name: Faker::Company.name, website: Faker::Internet.url, image_url: Faker::Company.logo)
  co.industries << Industry.all[n..n+3]
  co.locations << Location.all[n..n+3]
  co.contacts.create(name: Faker::Friends.character, title: Faker::Job.title, email: Faker::Internet.email)
  co.technologies << Technology.all[n..n+5]
  5.times do
    co.interview_questions.create(description: "#{Faker::Hacker.say_something_smart} What are your thoughts on #{Faker::Hacker.ingverb} #{Faker::Hacker.noun}?", company: co)
  end
end


3.times do |n|
  user = User.create(username: Faker::Internet.user_name, password: "password", image_url: Faker::Avatar.image("50x50"), first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  Workplace.create(user_id: user.id, company: Company.first, position: Faker::Job.title, status: 0)
  user.locations << Location.all[n]
end

2.times do |n|
  user = User.create(username: "username2#{n}", password: "password", image_url: Faker::Avatar.image("50x50"), first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  Workplace.create(user_id: user.id, company: Company.second, position: Faker::Job.title, status: 0)
  user.locations << Location.all[n]
end
