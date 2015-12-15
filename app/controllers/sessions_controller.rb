class SessionsController < ApplicationController
  def login

  end

  def login_attempt
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You logged in as #{user.username}!"
      redirect_to admin_path
    else
      flash[:danger] = "Invalid Username or Password"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    current_user = nil
    flash[:success] = "Logged out successfully!"
    redirect_to root_path
  end

  #def create
    #user = User.authenticate(params[:username], params[:hashed_password])
    #if user
      #session[:user_id] = user.id
      #redirect_to admin_path
    #else
      #flash[:danger] = "Invalid email/password combination."
      #redirect_to login_path
    #end
  #end

  #def destroy
    #session[:user_id] = nil
    #current_user = nil
    #flash[:success] = "Logged out successfully."
    #redirect_to root_path
  #end
end
