class Park < ActiveRecord::Base
  has_many :courts
  belongs_to :neighborhood
  
end
