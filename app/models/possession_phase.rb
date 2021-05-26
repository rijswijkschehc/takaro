# frozen_string_literal: true

class PossessionPhase < ApplicationRecord
  has_paper_trail only: %i[name]

  validates :name, presence: true
end
