class User < ActiveRecord::Base
	has_secure_password

	def generate_auth_token
	  payload = { user_id: self.id }
	  AuthToken.encode(payload)
	end


	def self.find_by_credentials(username,password)
		user = User.where(username: username).first
		(user && user.authenticate(password)) ? user : nil
	end





end
