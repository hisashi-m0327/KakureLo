class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def toggle_suspend
    @user = User.find(params[:id])
    @user.update(suspended: !@user.suspended)
    redirect_to admin_users_path, notice: "ユーザーの凍結状態を変更しました。"
  end
end
