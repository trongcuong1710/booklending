class AuthenticationService 
	def authenticate(login_model)
		unless login_model.valid?
			yield(login_model.errors.full_messages, nil)
		end

		user = User.find_by(email: login_model.email)
		
		unless user && user.authenticate(login_model.password)
			yield(["Login Failed! Invalid email or password"], nil)
		end

		yield(nil, user)
	end
end