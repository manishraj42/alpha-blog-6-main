class ApplicationController < ActionController::Base
  #this is available to all the controllers and also as a helper method
  helper_method :current_user,:logged_in?
  def current_user
		#memoization
		@current_user ||= User.find(session[:user_id]) if	session[:user_id]
	end

  def logged_in?
		#convert current_user to boolean	
		!!current_user
	end

  def require_user
    if !logged_in? 
      flash[:alert] = "you must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
