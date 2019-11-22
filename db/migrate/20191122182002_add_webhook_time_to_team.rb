class AddWebhookTimeToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :webhook_time, :decimal
  end
end
