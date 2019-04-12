class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update]

  def new
    @user=User.new
  end
  
  def create
    @user=User.new(user_params)
    
    if @user.save
      redirect_to user_path(@user.id)
      
    else
      render 'new'
    end
  end
  
  def show
  @user = User.find_by(id: params[:id])
  end
  

  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)      
  end
end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end