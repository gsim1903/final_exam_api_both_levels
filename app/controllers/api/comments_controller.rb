class Api::CommentsController < ApplicationController
  def create
    new_comment = Comment.new(comment_params)
    new_comment.save
    render json: { commment: new_comment }, status: 201
  end
end

private

def comment_params
  params[:comment].permit(:body, :article_id)

  
end
