# frozen_string_literal: true

class StaticPage < ApplicationRecord
  include AASM

  has_paper_trail only: %i[aasm_state content title]
  has_rich_text :content

  validates :title, presence: true
  validates :path, presence: true
  validates :aasm_state, presence: true

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
