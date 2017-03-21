class AuthenticationService 
	def is_authenticate?(email, password)
		if email == "hoanglong@siliconstraits.com" && password == "12345678"
			return true
		else
			return false
		end
	end
end