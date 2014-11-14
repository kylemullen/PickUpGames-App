class AddedStatusAndUserIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :user_id, :integer
    add_column :games, :status, :string, :default => "open"
  end
end
