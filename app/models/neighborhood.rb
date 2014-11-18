class Neighborhood < ActiveRecord::Base
  has_many :parks
  has_many :courts, :through => :parks
  has_many :games, :through => :courts
 
  
end
