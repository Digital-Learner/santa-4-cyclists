class StaticPagesController < ApplicationController

  include ItemsHelper

  def home
  end

  def search
    p params
    @searched_item = params[:q]
    @amazon_locale = params[:aAWSlocale]
    begin
      ad_builder(@searched_item, @amazon_locale)
      respond_to do |format|      
        format.html { render '_searched_item', layout: !request.xhr?, notice: "Looks like your in luck"}
        # format.json { render :json => {:html => render_to_string '_searched_item', layout: false}}
      end
    rescue
      if Amazon::AWS::Error
        flash.now[:error] = "Amazon could not find the item you requested"
        render :json => {:aAWSResult => "notFound"}, :status => 422
        # render :status => 404
        # respond_to do |format|
        #   # format.html {}
        #   # format.json { render :json => {:aAWSResult => "notFound"}}
        #   format.html { render "notFound" }
        # end
      end
    end
  end

  def nav_bar_reload
    render 'layouts/_header', layout: false
  end
end