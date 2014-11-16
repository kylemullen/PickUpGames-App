class Court < ActiveRecord::Base
	belongs_to :sport
	belogs_to :park
	has_many :games
end
