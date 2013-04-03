class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  # # after_filter :check_with_amazon, :only => [:create, :update]

  # helper_method :current_user

  protected

    def signed_in_user
      redirect_to login_path, notice: "Please login" unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    # def authenticate
    #   # debugger
    #   # think we need to beef this up!
    #   unless current_user
    #     flash[:notice] = "Please login to complete your request"
    #     # redirect_to login_path
    #   end
    # end

end
