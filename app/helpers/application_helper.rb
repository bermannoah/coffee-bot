module ApplicationHelper
  
  def show_coffee_on_index_page?
    if @most_recent_brew.nil?
      return false
    elsif session[:user_id].nil?
      return false
    elsif @most_recent_brew.team_id == current_user.team_id
      return true
    else
      return false
    end
  end
  
  def current_user
    @current_user = SlackLoginUser.find(session[:user_id]) if session[:user_id]
  end
  
end
