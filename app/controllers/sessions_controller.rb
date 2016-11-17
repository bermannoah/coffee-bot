class SessionsController < ApplicationController
  def new
   redirect_to SlackService.sign_in_uri
  end

 def create
   if user = SlackService.authenticate(params)
     session[:user_id] = user.id
     redirect_to root_path, flash: { success: "Signed in successfully." }
   else
     redirect_to root_path, flash: { warning: "Sign in unsuccessful. Please try again." }
   end
 end

 def destroy
   reset_session
   redirect_to root_path, flash: { success: "Signed out successfully." }
 end
end
