class UsersController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :login, :new, :create]
  before_filter :requires_admin, :only => [:edit, :update]
  
  def new
    @user = User.new
  end

  def index
    @users = User.is_admin
  end

  def create
    @users = User.create(user_params)
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.admin = false
    @user.save
  end

  def login

  end

  def logout
    redirect_to sessions_destroy_path 
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
