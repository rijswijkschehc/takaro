# frozen_string_literal: true

class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  has_paper_trail only: %i[content]
  has_rich_text :content

  belongs_to :commentable, polymorphic: true

  validates :content, presence: true

  after_create_commit do
    broadcast_append_later_to([commentable, :comments], target: "#{dom_id(commentable)}_comments")
  end

  after_update_commit do
    broadcast_replace_to self
  end

  after_destroy_commit do
    broadcast_remove_to self
  end
end
