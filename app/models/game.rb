class Game < ActiveRecord::Base
	belongs_to :user
	belongs_to :court
	has_many :gamed_players

	validates_presence_of :title
  validates_presence_of :players_committed
  validates_presence_of :players_looking_for
  validates_presence_of :court_id
  validates_presence_of :skill_level
  validates_presence_of :user_id
  
  def gamed_players_total
  	count = 0
  	gamed_players.each do |player|
  		count += player.players_bringing
  	end
  	new_total = players_committed + count 
  	return new_total
  end


  def signed_up_players
    count = 0
    gamed_players.each do |player|
      count += player.players_bringing
    end
    return count
  end

  def revised_players_looking_for
    return players_looking_for - signed_up_players
  end

  def game_full?
    if revised_players_looking_for > 0
      return false
    elsif revised_players_looking_for <= 0
      return true
    end
  end

  def make_closed
  	status = "closed"
  end


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
