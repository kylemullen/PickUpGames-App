class GamedPlayer < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

	validates_presence_of :user_id
	validates_presence_of :game_id
	validates_presence_of :players_bringing

end
