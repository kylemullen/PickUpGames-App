class Sport < ActiveRecord::Base
  has_many :neighborhoods
  has_many :courts
  has_many :games, :through => :courts
  has_many :parks, :through => :courts


	def park_list
		# parks = []   #map
		# courts.each do |court|
		# 	 parks << court.park_id
		# end
		# return parks
		parks = courts.map(&:park_number)
		return parks
	end



end
