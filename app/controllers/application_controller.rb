class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  # # after_filter :check_with_amazon, :only => [:create, :update]

  helper_method :current_user

  protected

    def authenticate
      # think we need to beef this up!
      unless current_user
        flash[:notice] = "Please login to complete your request"
        redirect_to login_path
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      # look at how to use cookies instead of session information for 'staying alive'
      # in Hartl example we are using remember_token and storing this in the user table (do we need?)
    end

end
