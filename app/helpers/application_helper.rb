module ApplicationHelper
	def random_password
		password_length = 8
    @password = Devise.friendly_token.first(password_length)
	end

	def random_phone
		rand(9999999).to_s.center(8, rand(9).to_s)
	end
end

