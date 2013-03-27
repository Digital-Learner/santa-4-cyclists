class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  protected

    def authenticate
      unless current_user
        flash[:notice] = "Please login to complete your request"
        redirect_to login_path
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
