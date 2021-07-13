# frozen_string_literal: true

class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  has_ancestry
  has_paper_trail only: %i[content]
  has_rich_text :content

  belongs_to :commentable, polymorphic: true

  validates :content, presence: true

  after_create_commit do
    broadcast_append_later_to([commentable, :comments],
                              target: "#{dom_id(parent || commentable)}_comments",
                              partial: 'comments/comment_with_replies')
  end

  after_update_commit do
    broadcast_replace_later_to(self)
  end

  after_destroy_commit do
    broadcast_remove_to(self)
    broadcast_action_to self, action: :remove, target: "#{dom_id(self)}_with_comments"
  end
end
