Fabricator(:brew) do
  team
  username { Faker::Name.name }
  location { Faker::Address.street_name }
  description { Faker::Hacker.say_something_smart }
end