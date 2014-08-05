class Task < ActiveRecord::Base
  attr_accessible :description, :name, :room_id, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :note
  has_attached_file :photo, :styles => { :medium => "300x300>"},
                    #:path => "tasks/:id/:style/:basename.:extension",
                    :url  => "#{Rails.env == 'production' ? '/lcroamer' : ''}/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
  
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  belongs_to :room
  belongs_to :location
  has_many :roams
  
  before_post_process :randomize_file_name 
  
  def randomize_file_name 
    extension = File.extname(photo_file_name) 
    self.photo.instance_write(:file_name,   
    "#{SecureRandom.hex.first(8)}#{extension}") 
  end
end
