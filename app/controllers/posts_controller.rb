class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "投稿しました。"
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました。"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "更新に失敗しました。入力内容を確認してください。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user), notice: "投稿を削除しました。"
  end




  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
