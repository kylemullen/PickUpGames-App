class Park < ActiveRecord::Base
 	has_many :sports, :through => :courts
  has_many :courts, :primary_key => "park_number"
 	has_many :games, :through => :courts
  
  belongs_to :neighborhood

  def game_list
  	game_list =[]
  	games.each do |game|
  		game_list << game
  	end
  	return game_list
  end

  def court_list
  	court_list = []
  	courts.each do |court|
  		court_list << court
  	end
  end

end
