class Court < ActiveRecord::Base
	belongs_to :sport
	belongs_to :park
	has_many :games
end
