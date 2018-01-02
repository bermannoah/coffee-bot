class Api::V1::CoffeeController < Api::V1::BaseController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
    render json: Brew.handle_request(params)
  end

  def show
    limit = Brew.get_limit(params["text"])
    render json: Brew.get_last_brewed(limit, params)
  end
    
end
