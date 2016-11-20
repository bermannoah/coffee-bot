class AddSlackDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :slack_uid, :string
    add_column :users, :slack_access_token, :text
    remove_column :users, :email
  end
end
