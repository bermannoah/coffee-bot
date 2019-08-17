Fabricator(:team) do
  team_name { Faker::App.name }
  team_slack_id { Faker::Number.number(digits: 10) }
  webhook_url { nil }
end
