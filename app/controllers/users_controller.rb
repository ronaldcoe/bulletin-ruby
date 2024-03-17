# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      # For example, you might want to log the user in and redirect them to a profile page:
      # log_in @user (you'll write this log_in method later)
      # redirect_to user_path(@user)
      flash[:success] = 'You have successfully created an account.'
      redirect_to login_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
