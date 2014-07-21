class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def destroy
    @comment.destroy
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
