class Api::V1::CoffeeController < Api::V1::BaseController

  def create
    render json: Brew.handle_request(params)
  end

  def show
    limit = Brew.get_limit(params["text"])
    render json: Brew.get_last_brewed(limit)
  end
    
end
