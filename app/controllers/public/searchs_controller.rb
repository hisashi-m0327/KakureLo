class Public::SearchsController < ApplicationController
  def search
    @query = params[:query]
    @target = params[:target]

    if @query.blank?
      @results =[]
      flash.now[:alert] = "検索ワードを入力してください"
      return
    end

    case @target
    when "user"
      @results = User.search(@query)
    else
      @results = Post.search(@query)
    end
  end
end
