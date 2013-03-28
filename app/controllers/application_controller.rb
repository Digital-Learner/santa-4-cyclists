class ApplicationController < ActionController::Base
  protect_from_forgery

  include Amazon::AWS
  include Amazon::AWS::Search

  after_filter :check_with_amazon, :only => [:create, :update]

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

    def check_with_amazon
      @check=@item.name
      begin
        is = ItemSearch.new( 'All', { 'Keywords' => @check } )
        rg = ResponseGroup.new( 'Medium' )
        req = Request.new
        req.locale = 'us'
        resp = req.search( is, rg )
        items = resp.item_search_response.items.item
      rescue
        if Amazon::AWS::Error
          @item.flag = 'false'
          @item.save
        end
      end
    end

end
