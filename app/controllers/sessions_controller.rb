class SessionsController < ApplicationController

  def new 
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #logging the user in
      session[:user_id] = user.id
      flash[:notice] = "logged in successfully"
      redirect_to user

    else 
      #here we are not redirecting and here it is flash.now
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'

    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end