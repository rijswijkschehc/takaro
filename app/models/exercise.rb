# frozen_string_literal: true

class Exercise < ApplicationRecord
  include AASM
  include Commentable

  has_paper_trail only: %i[aasm_state objective step_id title video]
  has_rich_text :description
  has_rich_text :tips
  has_rich_text :variation

  belongs_to :step
  has_many :exercise_principles, dependent: :destroy
  has_many :exercise_techniques, dependent: :destroy
  has_many :principles, through: :exercise_principles
  has_many :techniques, through: :exercise_techniques

  validates :aasm_state, presence: true
  validates :description, presence: true
  validates :objective, presence: true
  validates :tips, presence: true
  validates :variation, presence: true

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
