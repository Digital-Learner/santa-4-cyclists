class ApplicationController < ActionController::Base
  protect_from_forgery

  # Check with Max, don't think its required anymore!
  #
  # include Amazon::AWS
  # include Amazon::AWS::Search

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

    # Check with Max, don't think its required anymore!
    #
    # def check_with_amazon
    #   @check=@item.name
    #   begin
    #     is = ItemSearch.new( 'All', { 'Keywords' => @check } )
    #     rg = ResponseGroup.new( 'Medium' )
    #     req = Request.new
    #     req.locale = 'us'
    #     resp = req.search( is, rg )
    #     items = resp.item_search_response.items.item
    #   rescue
    #     if Amazon::AWS::Error
    #       @item.flag = 'false'
    #       @item.save
    #     end
    #   end
    # end

end
