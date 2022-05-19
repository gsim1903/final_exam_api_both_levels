class Api::CommentsController < ApplicationController
  def create
    new_comment = Comment.new
    render json: { commment: new_comment }, status: 201
  end
end
