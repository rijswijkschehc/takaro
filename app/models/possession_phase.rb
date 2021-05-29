# frozen_string_literal: true

class PossessionPhase < ApplicationRecord
  has_paper_trail only: %i[name]

  has_many :principles, dependent: :restrict_with_error

  validates :name, presence: true
end
