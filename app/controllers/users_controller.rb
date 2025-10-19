class UsersController < ApplicationController
  def shadow
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
  end
end
