class Game < ActiveRecord::Base
	belongs_to :user
	belongs_to :court


	def park_name
		court.park.name
	end

	def sport_name
		court.sport.name
	end
	
end
