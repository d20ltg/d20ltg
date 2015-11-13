class SessionsController < ApplicationController

  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
      #flash[:notice] = "Welcome!"
    else
      #flash[:error] = "Invalid email/password combination."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    current_user = nil
    #flash[:notice] = "Logged out successfully."
    redirect_to root_path
  end
end
