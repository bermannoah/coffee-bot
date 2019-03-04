class SessionsController < ApplicationController
  # Need this for the redirect.
  protect_from_forgery with: :null_session

  def create
    @user = SlackLoginUser.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def failure
    session.clear
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
