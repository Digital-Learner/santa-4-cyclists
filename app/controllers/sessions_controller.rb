class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      # sign_in @user
      redirect_to @user
    else
      flash[:error] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    system("say -v 'Vicki' 'Bye bye, come back to Santa 4 Cyclists soon!'")
    # Check that say is correct

    redirect_to root_url
  end
end
