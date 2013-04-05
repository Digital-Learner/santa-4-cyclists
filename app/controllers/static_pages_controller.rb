class StaticPagesController < ApplicationController

  include ItemsHelper

  def home
  end

  def search
    @searched_item = params[:q]
    begin
      ad_builder(@searched_item)
      respond_to do |format|      
        format.html { render '_searched_item', layout: !request.xhr?}
        # format.json { render :json => {:html => render_to_string '_searched_item', layout: false}}
      end
    rescue
      if Amazon::AWS::Error
        render :json => {:aAWSResult => "notFound"}
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