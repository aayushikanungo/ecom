class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin_user!

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def authenticate_admin_user!
    redirect_to root_path unless current_user.role == "admin"
  end
end
