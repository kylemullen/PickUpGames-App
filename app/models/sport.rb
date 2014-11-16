class Sport < ActiveRecord::Base
  has_many :neighborhoods
  has_many :courts
  has_many :games, :through => :courts
  has_many :parks, :through => :courts
end
