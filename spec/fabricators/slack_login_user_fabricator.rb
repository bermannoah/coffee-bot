Fabricator(:slack_login_user) do
  team_id { Fabricate(:team).id }
  username { Faker::Ancient.god }
  slack_uid { Faker::Number.number(8) }
  slack_access_token { Faker::Number.number(12) }
end