class Park < ActiveRecord::Base
 	has_many :sports, :through => :courts
 	has_many :games, :through => :courts
  has_many :courts
  
  belongs_to :neighborhood

  def game_list
  	
  end
end
