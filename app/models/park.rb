class Park < ActiveRecord::Base
 	has_many :sports, :through => :courts
  has_many :courts, :primary_key => "park_number"
 	has_many :games, :through => :courts
  
  belongs_to :neighborhood

  def game_list
  	courts.games
  	
  end
end
