require 'rails_helper'

describe ReadyService, type: :service do
  context "with a server on the pi" do
    scenario "it POSTs a new make if it is told that things are ready", :vcr do
      text = "coffee ready"
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: "coffee ready"
             }
     
      maker_bot_response = ReadyService.confirm_and_brew(data)

      expect(maker_bot_response["text"]).to be_a(String)
      expect(maker_bot_response["text"]).to eq("Starting to brew coffee!")
    end
    
    scenario "it gets the right response for different kinds of drinks", :vcr do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data_1 = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: "coffee ready"
             }
      data_2 = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: "tea ready"
             }
      data_3 = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: "water ready"
             }
      maker_bot_response_1 = ReadyService.confirm_and_brew(data_1)
      maker_bot_response_2 = ReadyService.confirm_and_brew(data_2)
      maker_bot_response_3 = ReadyService.confirm_and_brew(data_3)

      expect(maker_bot_response_1["text"]).to eq("Starting to brew coffee!")
      expect(maker_bot_response_2[:text]).to eq("Sorry, Coffee Maker Bot is unable to brew this at the moment.")
      expect(maker_bot_response_3[:text]).to eq("Sorry, Coffee Maker Bot is unable to brew this at the moment.")
    end

    scenario "it returns an error for an improper request", :vcr do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data_1 = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: "balloons"
             }
      data_2 = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: "1234"
             }
      data_3 = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: "Robert'); DROP TABLE Makes;--"
             }
  
      maker_bot_response_1 = ReadyService.confirm_and_brew(data_1)
      maker_bot_response_2 = ReadyService.confirm_and_brew(data_2)
      maker_bot_response_3 = ReadyService.confirm_and_brew(data_3)


      expect(maker_bot_response_1[:text]).to eq("Sorry, I'm not sure what you meant by that.")
      expect(maker_bot_response_2[:text]).to eq("Sorry, I'm not sure what you meant by that.")
      expect(maker_bot_response_3[:text]).to eq("Sorry, I'm not sure what you meant by that.")
    end

    scenario "it returns an error if not given anything to brew", :vcr do
      team = Fabricate(:team)
      user = Fabricate(:slack_login_user, team_id: team.id)
      data = { 
              team_id: team.id, 
              team_domain: team.team_name,
              user_id: user.id,
              user_name: user.username,
              command: "/make",
              text: ""
             }
      maker_bot_response_1 = ReadyService.confirm_and_brew(data)

      expect(maker_bot_response_1[:text]).to eq("Sorry, I'm not sure what you meant by that.")
    end
  end
end