class AddTeamToBrews < ActiveRecord::Migration[5.0]
  def change
    add_column :brews, :team, :text
  end
end
