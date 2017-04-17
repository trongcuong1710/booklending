class AuthenticatesController < ApplicationController
	def index 
		return render :layout => false unless current_user

		redirect_to "/books"
	end

	def login
		@login_model = LoginModel.new(params[:login_model])

		authenticate_service.authenticate(@login_model) do |errors, user|
			unless user
				flash.now[:errors] = errors
				return render "index", :layout => false	
			end

			session[:current_user_id] = user.id
			redirect_to '/books'
		end
	end

	def logout
		session[:current_user_id] = nil
		redirect_to '/'	
	end

	private
	def authenticate_service
		@service ||= AuthenticationService.new
	end

	def login_params
		params.require(:login_model).permit(:email, :password)
	end
end