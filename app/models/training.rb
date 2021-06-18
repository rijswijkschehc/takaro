# frozen_string_literal: true

class Training < ApplicationRecord
  include AASM

  has_paper_trail only: %i[title objective step_id aasm_state]

  belongs_to :step
  has_many :training_principles, dependent: :destroy
  has_many :principles, through: :training_principles

  validates :title, presence: true
  validates :objective, presence: true
  validates :step, presence: true

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
