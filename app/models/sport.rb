class Sport < ActiveRecord::Base
  has_many :neighborhoods
  has_many :courts
  has_many :games, :through => :courts
  has_many :parks, :through => :courts
end

def park_list
	park_list = []
	courts.park.each do |park|
		park_list << park
	end
	return park_list
end
