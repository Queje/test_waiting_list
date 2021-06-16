class UsersController < ApplicationController
  before_action :set_user, only: %i[destroy]
  after_action :save_cookie, only: %i[create]
  before_action :check_cookie, only: %i[destroy]
  
  def index
    @users = User.all.order(:subscription_date)
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    @user.waiting_status = 0

    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      puts "error delete"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def save_cookie
    cookies.encrypted[:email] = @user.email
  end

  def check_cookie
    unless @user.email == cookies.encrypted[:email]
      redirect_to root_path
    end
  end
end
