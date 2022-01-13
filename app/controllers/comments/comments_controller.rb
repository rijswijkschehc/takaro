# frozen_string_literal: true

module Comments
  class CommentsController < PrivateController
    extend Memoist
    include CommentableController

    private

    def authorize_user
      authorize(parent, :show?)
    end

    def parent
      Comment.find(params[:comment_id])
    end
    memoize :parent

    def commentable
      parent.commentable
    end
    memoize :commentable
  end
end
