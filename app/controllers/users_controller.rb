class UsersController < ApplicationController
  #before_filter :login_required, :except => [:index, :show, :login]
  #before_filter :requires_admin, :only => [:new, :edit, :create, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You signed up successfully!"
      redirect_to users_path
    else
      flash[:danger] = "Form is invalid"
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.admin = false
    User.delete(params[:id])
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
