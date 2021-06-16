class WaitingListController < ApplicationController
  before_action :set_user, only: %i[show update]
  before_action :check_cookie, only: %i[show update]

  def index
  
  end
  
  def show
    
  end

  def update
    @user.update(waiting_status: "confirmed", confirmation_date: DateTime.now)
    if @user.confirmed?
      redirect_to user_path(@user.id)
    else
      render 'show'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_cookie
    unless @user.email == cookies.encrypted[:email]
      redirect_to root_path
    end
  end

end
