Fabricator(:team) do
  team_name { Faker::Company.name }
  team_slack_id { Faker::Number.number(10) }
end