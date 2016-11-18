class CreateTeamsBrews < ActiveRecord::Migration[5.0]
  def change
    create_table :teams_brews do |t|
      t.references :brew, index:true, foreign_key: true
      t.references :team, index:true, foreign_key: true
    end
  end
end
