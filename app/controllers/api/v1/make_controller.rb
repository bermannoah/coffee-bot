class Api::V1::MakeController < Api::V1::BaseController
  def create
    type = params["text"]
    maker_response = ReadyService.confirm_and_brew(type)
    render json: maker_response
  end
end