class SlackLoginUser < ApplicationRecord
  
  validates_presence_of :username,
                        :slack_uid,
                        :slack_access_token
  validates_uniqueness_of :slack_uid
  
  def self.create_from_slack(user_info)
    return false if user_info["ok"] != true #Being explicit to avoid false positives on authentication (i.e. don't allow truthy)
    user = find_or_initialize_by(slack_uid: user_info["user"]["id"]) do |u|
      u.username           = user_info["user"]["name"]
      u.slack_access_token = user_info["access_token"]
      u.team_id            = find_team(user_info)
    end
      user.save ? user : false
  end
  
  private

  def self.find_team(user_info)
    team = Team.find_by(team_slack_id: user_info["team"]["id"])
    if team.nil?
      team = Team.create(team_name: user_info["team"]["domain"], team_slack_id: user_info["team"]["id"])
    else 
      team = team
    end
    team.id
  end
    
  
end