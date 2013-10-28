class Roam < ActiveRecord::Base
  attr_accessible :roamer_name, :task_id
  
  belongs_to :task
  belongs_to :user
end
