class Admin::DashboardsController < ApplicationController
  layout 'admin'
  
  def index
    @users = User.all
    @user_count = @users.count
  end
end
