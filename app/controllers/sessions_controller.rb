class SessionsController < ApplicationController

  def new
   redirect_to SlackService.sign_in_uri
  end

 def create
   user = SlackService.authenticate(params)
   if user
     session[:user_id] = user.id
     redirect_to root_path
   else
     redirect_to root_path
   end
 end

 def destroy
   session.clear
   redirect_to root_path
 end

end
