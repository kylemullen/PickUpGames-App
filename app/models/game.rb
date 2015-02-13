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
    count = gamed_players.inject(0) do |number, player|
      number += player.players_bringing 
    end

  	return count + players_committed
  end


  def signed_up_players
    count = gamed_players.inject(0) do |number, player|   # each_with_object
      number += player.players_bringing
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

  def game_today?
    if end_time > Time.now
      return true
    elsif end_time < Time.now
      return false
    end
  end

  def 

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
