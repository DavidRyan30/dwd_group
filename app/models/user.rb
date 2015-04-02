class User < ActiveRecord::Base
    before_save do |user| 
      	user.email = email.downcase 
    	  user.remember_token = SecureRandom.urlsafe_base64
    end
	has_many :lists
	validates :password, presence: true, length: { minimum: 6 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
		 format: {with: VALID_EMAIL_REGEX},
		 uniqueness: { case_sensitive: false}

	has_secure_password
end
