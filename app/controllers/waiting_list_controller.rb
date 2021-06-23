class WaitingListController < ApplicationController
  before_action :set_user, only: %i[show update]

  def index
  
  end
  
  def show
    
  end

  def update
    if @user.not_confirmed?
      @user.update(waiting_status: "confirmed", confirmation_date: DateTime.now)
      if @user.confirmed?
        redirect_to user_path(@user.token)
      else
        render 'show'
      end
    else
      @user.update(waiting_status: "confirmed")
      if @user.confirmed?
        redirect_to user_path(@user.token)
      else
        render 'show'
      end
    end 
  end

  private

  def set_user
    @user = User.find_by(token: params[:token])
  end

end
