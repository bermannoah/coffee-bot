class AddWebhookTextToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :webhook_text, :string
  end
end
