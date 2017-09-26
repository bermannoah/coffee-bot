class Api::V1::KettleController < Api::V1::BaseController

  def create
    render json: Brew.handle_request(params)
  end

  def show
    limit = Brew.get_limit(params["text"])
    render json: Brew.get_last_brewed(limit, params)
  end
    
end
