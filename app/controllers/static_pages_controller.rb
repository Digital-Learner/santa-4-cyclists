class StaticPagesController < ApplicationController

  include ItemsHelper

  def home
  end

  def search
    @searched_item = params[:q]
    ad_builder(@searched_item)
    render '_searched_item'#, :local @

  end

  # protected

  #   def searched_for_item_check_with_amazon
  #     @check=@searched_item
  #     # items = []
  #     begin
  #       is = ItemSearch.new( 'All', { 'Keywords' => @check } )
  #       rg = ResponseGroup.new( 'Medium' )
  #       req = Request.new
  #       req.locale = 'us'
  #       resp = req.search( is, rg )
  #       items = resp.item_search_response.items.item
  #       # items = resp.item_search_response.items.item
  #       redirect_to @item
  #     rescue
  #       if Amazon::AWS::Error

  #       end
  #     end
  #   end
end