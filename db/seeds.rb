require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean
Faker::UniqueGenerator.clear

industries = ["Hospitality", "Accounting", "Administration", "Education", "Construction", "Manufacturing", "Marketing", "IT"]


job_titles = ["Developer", "Software Engineer", "Junior Developer", "Backend Developer",
"Senior Developer", "Programmer", "Software Architect", "Frontend Developer"]

technologies = ["JavaScript", "Java", "Python", "TypeScript", "PHP", "Ruby on Rails", "Elixir", "Rust", "Go", "C#", "Swift", "Ruby"]

technologies.each do |tech|
  Technology.create!(name: tech)
end

industries.each do |industry|
  Industry.create!(name: industry)
end

us_states =
    [
     ['Montgomery', 'AL'],['Juneau', 'AK'],['Phoenix', 'AZ'],['Little Rock', 'AR'],
     ['Sacramento', 'CA'],['Denver', 'CO'], ['Hartford', 'CT'],
     ['Dover', 'DE'],['District of Columbia', 'DC'],['Tallahassee', 'FL'],
     ['Atlanta', 'GA'],['Honolulu', 'HI'],['Boise', 'ID'],['Springfield', 'IL'],
     ['Indianapolis', 'IN'],['Des Moines', 'IA'],['Topeka', 'KS'],['Frankfort', 'KY'],
     ['Baton Rouge', 'LA'],['Augusta', 'ME'], ['Annapolis', 'MD'],['Boston', 'MA'],
     ['Lansing', 'MI'],['Saint Paul', 'MN'],['Jackson', 'MS'],['Jefferson City', 'MO'],
     ['Helena', 'MT'],['Lincoln', 'NE'],['Carson City', 'NV'],['Concord', 'NH'],
     ['Trenton', 'NJ'],['Santa Fe', 'NM'],['Albany', 'NY'],['Raleigh', 'NC'],
     ['Bismarck', 'ND'],['Columbus', 'OH'],['Oklahoma City', 'OK'],['Salem', 'OR'],
     ['Harrisburg', 'PA'],['Puerto Rico', 'PR'],['Providence', 'RI'],
     ['Columbia', 'SC'],['Pierre', 'SD'],['Nashville', 'TN'],
     ['Austin', 'TX'],['Salt Lake City', 'UT'],['Montpelier', 'VT'],['Richmond', 'VA'],
     ['Olympia', 'WA'],['Charleston', 'WV'],['Madison', 'WI'],
     ['Cheyenne', 'WY']
   ]

us_states.each do |state|
  Location.create!(city: state[0], state: state[1])
end

10.times do |n|
  co = Company.create!(name: Faker::Company.name, website: Faker::Internet.url,
                      image_url: Faker::Company.logo)
  4.times do
    co.industries << Industry.all[rand(0..7)]
  end
  co.locations << Location.all[n..n+3]
  co.contacts.create(name: Faker::Friends.character, title: Faker::Job.title,
                     email: Faker::Internet.email)
  co.technologies << Technology.all[n..n+5]
  5.times do
    co.interview_questions.create!(description: "#{Faker::Hacker.say_something_smart} What are your thoughts on #{Faker::Hacker.ingverb} #{Faker::Hacker.noun}?",
                                  company: co)
  end
end

50.times do |n|
  user = User.create(username: Faker::Internet.unique.user_name,
                    password: "password",
                    image_url: Faker::Avatar.image("50x50"),
                    cohort: "1705 BE", first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    about_me: Faker::Lorem.paragraph,
                    interest: Technology.all.sample.name,
                    working_on: Faker::App.name)

  Workplace.create(user_id: user.id,
                  company: Company.first,
                  position: job_titles[rand(0..7)],
                  status: 0)

  user.locations << Location.all[rand(0..9)]
  4.times do
    user.technologies << Technology.all[rand(0..10)]
  end
  user.technologies << Technology.all[11]
end

50.times do |n|
  user = User.create(username: Faker::Internet.unique.user_name,
                    password: "password",
                    image_url: Faker::Avatar.image("50x50"),
                    cohort: "1705 FE",
                    first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    email: Faker::Internet.email,
                    about_me: Faker::Lorem.paragraph,
                    interest: Technology.all.sample.name,
                    working_on: Faker::App.name)

  Workplace.create(user_id: user.id, company: Company.second, position: job_titles[rand(0..7)], status: 0)
  user.locations << Location.all[rand(0..9)]
  4.times do
    user.technologies << Technology.all[rand(1..11)]
  end
  user.technologies << Technology.all[0]
end
