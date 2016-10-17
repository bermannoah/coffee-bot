class CreateBrews < ActiveRecord::Migration[5.0]
  def change
    create_table :brews do |t|
      t.string :user_name
      t.string :location
      t.string :description

      t.timestamps null: false
    end
  end
end
