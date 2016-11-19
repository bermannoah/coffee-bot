class CoffeeController < ApplicationController
  
  def index
    @display = Brew.index_brew_display(current_user)
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