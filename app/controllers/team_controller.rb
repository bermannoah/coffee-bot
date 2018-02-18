class TeamController < ApplicationController
  before_action :logged_in?

  def edit
    @team = Team.find_by(id: current_user.team_id)
    @current_webhook = @team.webhook_url if @team.webhook_url
  end

  def update
    @team = Team.find_by(id: current_user.team_id)
    updated_webhook = params['/team_customization']['slack_webhook']
    @team.webhook_url = updated_webhook
    @team.save
  end
end
