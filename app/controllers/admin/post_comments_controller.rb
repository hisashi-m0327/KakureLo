class Admin::PostCommentsController < ApplicationController
  before_action :set_comment, only: [:update]

  def update
    @comment.update(hidden: !@comment.hidden)
    message = @comment.hidden? ? "コメントを非表示にしました" : "コメントの非表示を解除しました"
    redirect_to admin_post_path(@comment.post), notice: message
  end

  private

  def set_comment
    @comment = PostComment.find(params[:id])
  end
end
