class AddTeamTable < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.text :team_id
      
      t.timestamps null: false
    end
  end
end
