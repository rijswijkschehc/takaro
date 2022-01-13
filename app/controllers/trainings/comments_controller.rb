# frozen_string_literal: true

module Trainings
  class CommentsController < PrivateController
    extend Memoist
    include CommentableController

    private

    def authorize_user
      authorize(commentable, :show?)
    end

    def commentable
      Training.find(params[:training_id])
    end
    memoize :commentable
  end
end
