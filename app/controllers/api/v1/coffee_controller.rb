class Api::V1::CoffeeController < Api::V1::BaseController
  
  def create
    brew = Brew.create_new_brew(params)
    render json: brew.get_response
  end
  
  def show
    render json: Brew.last.get_last_brewed
  end
  
end