class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create 
    @user = User.new(params[:user])
    @user.save!

    redirect_to '/'
  end

  def new
    @user = User.new  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params['id'])
    if user.update_attributes(params['user'])
      redirect_to users_path
    else 
      redirect_to vendors_path 
    end
  end

  def destroy 
    User.find(params[:id]).delete 
    redirect_to users_path
  end


end