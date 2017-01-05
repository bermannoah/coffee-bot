class Api::V1::MakeController < Api::V1::BaseController
  def create
    type = params["text"]
    maker_response = NewMakeService.start_making_a_drink(type)
    render json: maker_response
  end
end