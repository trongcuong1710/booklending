class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

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

  rescue_from ActionController::ParameterMissing do |exception|
    respond_to do |format|
      format.html do
        flash[:error] = "Missing required paramter: #{exception.param}"
        redirect_back(fallback_location: '/')
      end
    end
  end

  def admin_authentication_required!
    current_user || raise(ApplicationNotAuthenticated)
  end
end
