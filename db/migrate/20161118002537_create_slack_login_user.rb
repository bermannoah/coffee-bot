class CreateSlackLoginUser < ActiveRecord::Migration[5.0]
  def change
    create_table :slack_login_users do |t|
      t.string :username
      t.string :slack_uid
      t.text :slack_access_token

      t.timestamps null: false
    end
  end
end
