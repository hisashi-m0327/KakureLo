class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :set_post, only: [:show, :update]

  def index
    @posts = Post.all
  end

  def show
    @post_comments = @post.post_comments
  end

  def update
    @post.update(hidden: !@post.hidden)
    message = @post.hidden? ? "投稿を非表示にしました" : "投稿の非表示を解除しました"
    redirect_to admin_posts_path, notice: message
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
