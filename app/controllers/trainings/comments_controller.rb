# frozen_string_literal: true

module Trainings
  class CommentsController < PrivateController
    include CommentableController

    before_action :set_commentable

    private

    def set_commentable
      @commentable = Training.find(params[:training_id])
    end
  end
end
