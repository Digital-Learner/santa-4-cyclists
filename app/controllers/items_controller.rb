class ItemsController < ApplicationController

  # require 'amazon/aws'
  # require 'amazon/aws/search'
  # include Amazon::AWS
  # include Amazon::AWS::Search

  before_filter :authenticate, :only => [ :create, :destroy, :show ]

  # after_filter :check_with_amazon, :only => [:create, :update]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end


  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    # @user = params.merge(current_user)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        # format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end


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
