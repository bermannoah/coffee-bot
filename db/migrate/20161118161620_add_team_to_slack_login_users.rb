class AddTeamToSlackLoginUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :slack_login_users, :team
    add_reference :slack_login_users, :team, index: true, foreign_key: true
  end
end
