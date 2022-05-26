class Api::CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :find_article, only: %i[create]

  def create
    new_comment = @article.comments.create(body: comment_params[:body], user: current_user)
    
    render json: { commment: new_comment }, status: 201
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params[:comment].permit(:body)
  end
end
