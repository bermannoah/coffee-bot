module ApplicationHelper
  
  def show_coffee_on_index_page?
    if @most_recent_brew.nil?
      return false
    elsif @most_recent_brew.team_id == current_user.team_id
      return true
    else
      return false
    end
  end
  
end
