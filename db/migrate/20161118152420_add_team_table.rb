class AddTeamTable < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.text :team_slack_id
      
      t.timestamps null: false
    end
  end
end
