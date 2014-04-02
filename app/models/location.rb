class Location < ActiveRecord::Base
  attr_accessible :name
  
  has_many :rooms
  has_many :tasks, :through => :rooms
end
