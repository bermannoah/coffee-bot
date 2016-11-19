class CoffeeController < ApplicationController
  
  def index
    if current_user 
      @most_recent_brew = Brew.where(team_id: current_user.team_id).last
    end
  end
  
  def show
    find_current_team
    @brews = Brew.where(team_id: @team.id).order(created_at: :desc)
  end
  
  def how
  end
  
  def info
  end
  
  private
  
  def show_to_user
    @slack_user = SlackLoginUser.find(current_user.id)
  end
  
  def find_current_team
    show_to_user
    @team = Team.find(@slack_user.team_id)
  end
  
end