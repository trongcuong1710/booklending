class AuthenticatesController < ApplicationController
	def index 
		unless session[:current_user]
			render :layout => false
			return
		end

		redirect_to "/books"
	end

	def login
		email = params[:email]
		password = params[:password]

		service = AuthenticationService.new

		if service.is_authenticate?(email, password)
			session[:current_user] = true

			unless session[:redirect]
				redirect_to '/books'
			else
				redirect_to session[:redirect]
				session[:redirect] = nil
			end
		else
			flash[:error] = "Invalid user name or password"
			redirect_to '/'
		end
	end

	def logout
		session[:current_user] = nil
		redirect_to '/'	
	end
end