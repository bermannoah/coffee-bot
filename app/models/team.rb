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
  
  private
  
  def create_tenant
    Apartment::Tenant.create(team_name)
  end
  
end