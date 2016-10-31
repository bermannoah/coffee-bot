class CoffeeController < ApplicationController
  
  def index
    @most_recent_brew = Brew.last
  end
  
  def show
    @brews = Brew.order(created_at: :desc)
  end
  
  def how
  end
  
  def info
  end
  
end