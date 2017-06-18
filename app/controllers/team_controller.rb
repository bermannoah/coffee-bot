class TeamController < ApplicationController
  before_action :logged_in?

  def edit
    @team = Team.find_by(id: current_user.team_id)
  end

end
