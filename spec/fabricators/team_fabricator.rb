Fabricator(:team) do
  team_name { Faker::Company.suffix }
  team_slack_id { Faker::Number.number(10) }
end