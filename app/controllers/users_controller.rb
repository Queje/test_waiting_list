class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  
  def index
    @users = User.all.order(:confirmation_date)
  end

  def show
    @position = User.where(waiting_status: "confirmed").order(:confirmation_date).index(@user) + 1
  end

  def new
    @user = User.new  
  end

  def create
    @user = User.new(user_params)
    @user.waiting_status = "not_confirmed"

    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    if @user.destroy
      redirect_to waiting_list_index_path
    else
      render waiting_list_path(@user.token)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :token)
  end

  def set_user
    @user = User.find_by(token: params[:token])
  end
end
