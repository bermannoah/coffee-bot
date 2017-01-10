class Api::V1::MakeController < Api::V1::BaseController
  def create
    brew_data = params
    maker_response = ReadyService.confirm_and_brew(brew_data)
    render json: maker_response
  end
end