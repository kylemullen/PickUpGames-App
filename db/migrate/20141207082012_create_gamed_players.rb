class CreateGamedPlayers < ActiveRecord::Migration
  def change
    create_table :gamed_players do |t|
    	t.integer :game_id
      t.integer :user_id
      t.integer :players_bringing

      t.timestamps
    end
  end
end
