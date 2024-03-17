class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      session[:user_id] = user.id
      login_url user # This method should be written as part of your sessions helper.
      flash[:success] = 'You have successfully logged in.'
      redirect_to root_path
    else
      # Create an error message.
      flash[:alert] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "You've been logged out successfully."
    redirect_to root_url
  end
end
