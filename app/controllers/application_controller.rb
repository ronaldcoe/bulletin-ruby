# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
    helper_method :current_user
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def authenticate_user
      unless current_user
        flash[:alert] = "You must be logged in to perform this action."
        redirect_to login_path
      end
    end
    
    
end
  