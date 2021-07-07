# frozen_string_literal: true

module Commentable
  extend ActiveSupport::Concern

  def create
    @comment = @commentable.comments.new(safe_comment_params)
    @comment = Comment.new if @comment.save

    respond_to do |format|
      format.turbo_stream { render 'comments/create' }
    end
  end

  private

  def safe_comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
