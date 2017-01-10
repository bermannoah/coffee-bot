class Api::V1::MakeController < Api::V1::BaseController
  def create
    request = params["text"]
    maker_response = ReadyService.confirm_and_brew(request)
    render json: maker_response
  end
end