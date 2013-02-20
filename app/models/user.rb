class User < ActiveRecord::Base
	attr_accessible :email, :name, :password

	before_save { |user| user.email = email.downcase }
	
	validates :name,  :presence => true, :length => { :maximum => 50 }

	VALIDATE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,	:presence => true, 
						:format => { :with => VALIDATE_EMAIL_REGEX },
	  					:uniqueness => { :case_sensitive => false }

	validates :password,  :presence => true, :length => { :maximum => 16 }

end
