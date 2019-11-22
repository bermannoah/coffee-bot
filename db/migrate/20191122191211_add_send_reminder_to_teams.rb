class AddSendReminderToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :send_reminder, :boolean, default: false
  end
end
