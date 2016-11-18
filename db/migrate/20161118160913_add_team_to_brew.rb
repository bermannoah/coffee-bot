class AddTeamToBrew < ActiveRecord::Migration[5.0]
  def change
    add_reference :brews, :team, index: true, foreign_key: true
  end
end
