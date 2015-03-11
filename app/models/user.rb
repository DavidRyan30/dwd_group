class User < ActiveRecord::Base
	
	has_many :lists
	validates :password, presence: true, length: { minimum: 6 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
		 format: {with: VALID_EMAIL_REGEX},
		 uniqueness: { case_sensitive: false}
end
