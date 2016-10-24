class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment  =  @article.comments.new(author: current_user.username, body:  comment_params[:body])
    @comment.save
 
    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end