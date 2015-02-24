class Court < ActiveRecord::Base
	belongs_to :sport
	belongs_to :park, :primary_key => "park_number"
	has_many :games

	def game_here?
		
	end
end
