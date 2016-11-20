class CoffeeController < ApplicationController
  
  def index
    @display = Brew.index_brew_display(current_user)
  end
  
  def show
    @brews = Brew.find_brew_by_team(current_user)
  end
  
  def how
  end
  
  def info
  end
    
end