class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ApplicationNotAuthenticated = Class.new(StandardError)

  rescue_from ApplicationNotAuthenticated do
    respond_to do |format|
      format.json { render json: { errors: [message: "401 Not Authorized"] }, status: 401 }
      format.html do
        flash[:error] = "Login require!!!"
        session[:redirect] = request.fullpath
        redirect_to "/"
      end
      format.any { head 401 }
    end
  end

  def admin_authentication_required!
    session[:current_user] || raise(ApplicationNotAuthenticated)
  end
end
