class AddWebhookUrlToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :webhook_url, :string
  end
end
