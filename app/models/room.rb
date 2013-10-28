class Room < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location
  has_many :tasks
end
