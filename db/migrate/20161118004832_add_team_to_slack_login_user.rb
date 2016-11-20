class AddTeamToSlackLoginUser < ActiveRecord::Migration[5.0]
  def change
    add_column :slack_login_users, :team, :text
  end
end
