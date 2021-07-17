# frozen_string_literal: true

module Comments
  class CommentsController < PrivateController
    include CommentableController

    before_action :set_commentable

    private

    def set_commentable
      @parent = Comment.find(params[:comment_id])
      @commentable = @parent.commentable
    end
  end
end
