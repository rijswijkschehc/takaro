# frozen_string_literal: true

module Exercises
  class CommentsController < PrivateController
    extend Memoist
    include CommentableController

    private

    def authorize_user
      authorize(commentable, :show?)
    end

    def commentable
      Exercise.find(params[:exercise_id])
    end
    memoize :commentable
  end
end
