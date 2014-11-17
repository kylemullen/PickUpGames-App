class AddPlayersLookingForTogames < ActiveRecord::Migration
  def change
    add_column :games, :players_looking_for, :integer
    add_column :games, :players_committed, :integer
  end
end
