class Court < ActiveRecord::Base
	belongs_to :sport
	belongs_to :game
end
