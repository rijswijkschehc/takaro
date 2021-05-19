# frozen_string_literal: true

class StaticPage < ApplicationRecord
  include AASM

  has_paper_trail only: %i[aasm_state content path title]
  has_rich_text :content

  validates :aasm_state, presence: true
  validates :path, presence: true
  validates :title, presence: true

  aasm do
    state :draft, initial: true
    state :published
    state :archived

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end

    event :archive do
      transitions to: :archived
    end
  end
end
