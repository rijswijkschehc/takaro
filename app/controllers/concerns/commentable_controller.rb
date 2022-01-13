# frozen_string_literal: true

module CommentableController
  extend ActiveSupport::Concern

  def create
    comment = commentable.comments.build(safe_comment_params)
    comment.parent = parent
    response_comment = comment.save ? Comment.new : comment

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: stream_comment_form(comment: response_comment)
      end
    end
  end

  private

  def safe_comment_params
    params.require(:comment).permit(:content)
  end

  def stream_comment_form(comment:)
    turbo_stream.replace(
      helpers.combined_dom_id(parent || commentable, comment),
      partial: 'comments/form',
      locals: locals(comment: comment)
    )
  end

  def locals(comment:)
    {}.tap do |h|
      h[:commentable] = parent || commentable
      h[:comment] = comment
      if parent
        h[:data] = { comment_target: 'replyForm' }
        h[:class] = 'd-none' if comment.persisted?
      end
    end
  end

  def parent
    super if defined?(super)
  end
end
