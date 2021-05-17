# frozen_string_literal: true

class TargetCategory < ApplicationRecord
  has_paper_trail only: %i[name]

  validates :name, presence: true
end
