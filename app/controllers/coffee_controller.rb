class CoffeeController < ApplicationController
  
  def index
    @brews = Brew.order(created_at: :desc)
  end
  
  
end