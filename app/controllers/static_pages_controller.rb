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
      end
    rescue
      if Amazon::AWS::Error
        render :json => {:aAWSResult => "notFound"}
      end
    end
  end

  def nav_bar_reload
    render 'layouts/_header', layout: false
  end
end