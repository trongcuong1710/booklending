class AuthenticatesController < ActionController::Base
	def index 
		render :layout => false
	end

	def login
		email = params[:email]
		password = params[:password]

		if email == "hoanglong@siliconstraits.com" && password == "12345678"
			redirect_to '/books'
		else
			flash['error'] = "Invalid user name or password"
			redirect_to '/'
		end
	end
end