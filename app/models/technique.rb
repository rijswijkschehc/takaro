# frozen_string_literal: true

class Technique < ApplicationRecord
  has_paper_trail only: %i[description grip name video]
  has_rich_text :description

  enum grip: { basic: 0, double_v: 1, frying_pan: 2 }

  has_many :exercise_techniques, dependent: :destroy
  has_many :exercises, through: :exercise_techniques

  validates :description, presence: true
  validates :grip, presence: true
  validates :name, presence: true
end
