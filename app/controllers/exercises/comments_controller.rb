# frozen_string_literal: true

module Exercises
  class CommentsController < PrivateController
    include Commentable

    before_action :set_commentable

    private

    def set_commentable
      @commentable = Exercise.find(params[:exercise_id])
    end
  end
end
