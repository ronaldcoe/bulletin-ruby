# app/helpers/sessions_helper.rb
module SessionsHelper
    # Logs in the given user.
    def log_in(user)
      session[:user_id] = user.id
    end
  
    # define the current user
    def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # Logs out the current user.
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
  end
  