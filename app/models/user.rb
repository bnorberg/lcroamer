class User < ActiveRecord::Base
  attr_accessible :access_token, :email, :provider, :uid, :username
  
  has_many :roams
  
  
  def self.from_omniauth(auth)
     find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
   end
  
  def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.username = auth["info"]["name"]
        user.email = auth["info"]["email"]
        user.access_token = auth["credentials"]["token"]
        user.save
      end
  end
end
