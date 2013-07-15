class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
    @customers = User.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @customers.to_csv }
      format.xls { send_data @customers.to_csv(col_sep: "\t") }
    end
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
        UserMailer.signup_confirmation(@user).deliver
        redirect_to @user, notice: "Signed up successfully."
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

  def show
    @user = User.find(params[:id])
  end

end