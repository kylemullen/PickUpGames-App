class Sport < ActiveRecord::Base
  has_many :neighborhoods
  has_many :courts
  has_many :games, :through => :courts
  has_many :parks, :through => :courts


	def park_list
		# parks = courts.parks.
		# park_list = []   #map
		# courts.park.each do |park|
		# 	park_list << park
		# end

		parks = courts.park.map(&:court)
	return park_list


	end



end
