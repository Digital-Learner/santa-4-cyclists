class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      respond_to do |format|
        format.html { redirect_to @user, notice: "You are now able to save items" }
        format.json { render :json => {:loggedIn => "ok"}}
      end      
    else
      respond_to do |format|
        format.html do
          flash.now[:error] = "Invalid email/password combination"
          render :new
        end
        format.json do
          render :json => {:loggedIn => :failed}
        end
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    # system("say -v 'Vicki' 'Bye bye, come back to Santa 4 Cyclists soon!'")
  end
end
