class Api::V1::CoffeeController < Api::V1::BaseController
  
  def create
    brew = Brew.create_new_brew(params)
    binding.pry
  end
  
end