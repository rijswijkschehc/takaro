# frozen_string_literal: true

module CommentHelper
  def comment_wrapper(comment:, &block)
    tag.div(id: "#{dom_id(comment)}_with_comments", data: { controller: 'comment' }) do
      comment.root? ? root_comment(&block) : child_comment(&block)
    end
  end

  private

  def root_comment(&block)
    tag.div(class: 'row mb-1') do
      tag.div(class: 'col') do
        tag.div(class: 'card') do
          tag.div(class: 'card-body') do
            yield(block)
          end
        end
      end
    end
  end

  def child_comment(&block)
    tag.div(class: 'ps-3 border-start') do
      yield(block)
    end
  end
end
