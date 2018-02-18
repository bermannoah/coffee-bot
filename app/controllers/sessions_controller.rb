class SessionsController < ApplicationController
  def new
   redirect_to SlackService.sign_in_uri
  end

  def create
    user = SlackService.authenticate(params)
    if user
      session[:user_id] = user.id
    else
      redirect_to root_path
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
