class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = "Welcome!"
    else
      flash[:danger] = "Invalid email/password combination."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    current_user = nil
    flash[:success] = "Logged out successfully."
    redirect_to root_path
  end
end
