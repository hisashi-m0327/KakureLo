class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  def index
    if params[:query].present?
      @users = User.where("name LIKE ? OR email LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @users = User.all
    end
    @user_count = @users.count
  end

  def toggle_suspend
    @user = User.find(params[:id])
    @user.update(suspended: !@user.suspended)

    if @user.suspended?
      notice_message = "アカウントを停止しました"
    else
      notice_message = "アカウント停止を解除しました"
    end
    redirect_to admin_dashboards_path, notice: notice_message
  end
end
