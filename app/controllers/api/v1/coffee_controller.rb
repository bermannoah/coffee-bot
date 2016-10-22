class Api::V1::CoffeeController < Api::V1::BaseController

  def create
    brew = Brew.create_new_brew(params)
    render json: brew.get_response
  end

  def show
    limit = Brew.get_limit(params["text"])
    render json: Brew.get_last_brewed(limit)
  end
    
end
