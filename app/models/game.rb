class Game < ActiveRecord::Base
	belongs_to :user
	belongs_to :court

	validates_presence_of :title
  validates_presence_of :players_committed
  validates_presence_of :players_looking_for
  validates_presence_of :court_id
  validates_presence_of :skill_level
  validates_presence_of :user_id
  # validates_uniqueness_of :court_id
  

	def park_name
		court.park.name
	end

	def sport_name
		court.sport.name
	end

	def first_name
		user.first_name
	end
	
	def last_name
		user.last_name
	end

	def email
		user.email
	end
	
end
