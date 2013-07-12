class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new

  end

  def create 
    @user = User.new(params[:user])
    if @user.save
       redirect_to users_path
    else
      render :new
    end
  end

  def new
    @user = User.new  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params['id'])
    if @user.update_attributes(params['user'])
      redirect_to user_path(@user)
    else 
      render :edit
    end
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy  
    render json: @user
  end


end