class SlackLoginUsersController < ApplicationController
  
  before_action :set_user, only: [:destroy]

  def new
    @user = SlackLoginUser.new
  end

  def create
    @user = SlackLoginUser.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to index_path, notice: 'Account successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to index_path, notice: 'Account was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = SlackLoginUser.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :slack_uid, :slack_client_id)
    end

end
  