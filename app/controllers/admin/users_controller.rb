class Admin::UsersController < ApplicationController

  after_action :destroy 

  def index
    @users = User.order("email").page(params[:page]).per(5) 
  end 

  def destroy 
    @delete = User.find(params[:id])
    @delete.destroy
    redirect_to admin_users_path
  end 

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to admin_users_path
  end 

  def email_notify
  end 

protected 
  def user_params
  params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
