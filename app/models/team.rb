class Team < ActiveRecord::Base
  after_create :create_tenant
  has_many :brews
  
  def self.find_team(user_info)
    team = find_by(team_slack_id: user_info["team"]["id"])
    if team.nil?
      team = create(team_name: user_info["team"]["domain"], team_slack_id: user_info["team"]["id"])
    else 
      team = team
    end
    team.id
  end
  
  def self.find_team_from_params(params)
    team = Team.find_by(team_name: params["team_domain"])
      if team.nil?
        team = Team.create(team_name: params["team_domain"], team_slack_id: params["team_id"])
      else 
        team = team
      end
   team
  end
  
  private
  
  def create_tenant
    Apartment::Tenant.create(team_name)
  end
  
end
