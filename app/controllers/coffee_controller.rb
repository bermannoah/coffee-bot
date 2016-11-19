class CoffeeController < ApplicationController
  
  def index
    @display = Brew.index_brew_display(current_user)
  end
  
  def show
    team = Brew.find_current_team(current_user)
    @brews = Brew.find_brew_by_team(team)
  end
  
  def how
  end
  
  def info
  end
    
end