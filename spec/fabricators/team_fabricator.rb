Fabricator(:team) do
  team_name { Faker::Book.publisher }
  team_slack_id { Faker::Number.number(10) }
end