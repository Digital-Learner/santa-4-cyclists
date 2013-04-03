class UsersController < ApplicationController

  # before_filter :authenticate, :only => [ :update, :destroy, :edit, :show ]

  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]

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
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
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
    system("say 'Are you sure about that!'")
    @user.delete
    flash[:success] = "profile deleted"
    session[:user_id] = nil
    redirect_to root_url
  end
end


