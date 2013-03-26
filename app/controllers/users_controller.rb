class UsersController < ApplicationController

  before_filter :authenticate, :only => [ :update, :destroy ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # how to do in the controller
    # if params[:user][:password].blank? || (params[:user][:password] != params[:user][:password_confirmation])
    #   render :new
    #   return
    # end
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = current_user
    if @user && @user.update_attributes(params[:user])
      flash[:success] = "updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    #  make sure this user matches the current user
    redirect_to users_path unless @user.id == current_user.id
      @user.delete
      flash[:success] = "profile deleted"
      session[:user_id] = nil
      redirect_to root_url
    # end

  end
end


