class User < ActiveRecord::Base
  #finds user by provider and uid or creates one with credentials if none exists
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email= auth.info.email
      user.pic_url = auth.info.image
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  has_many :courses, through: :enrollments 
end
