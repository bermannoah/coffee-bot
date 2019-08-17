Fabricator(:slack_login_user) do
  team_id { Fabricate(:team).id }
  username { Faker::Ancient.god }
  slack_uid { Faker::Number.number(digits: 8) }
  slack_access_token { Faker::Number.number(digits: 12) }
end
