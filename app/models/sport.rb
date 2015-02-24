class Sport < ActiveRecord::Base
  has_many :neighborhoods
  has_many :courts
  has_many :games, :through => :courts
  has_many :parks, :through => :courts


	def self.park_list
		parks_array = Sport.courts.map(&:park_id)	
	end

	def self.game_list
		games_array = Sport.courts.map(&:games)
	end



end
