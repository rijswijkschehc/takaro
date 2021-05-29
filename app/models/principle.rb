# frozen_string_literal: true

class Principle < ApplicationRecord
  has_paper_trail only: %i[description hex_color icon name possession_phase tagline]
  has_rich_text :description

  belongs_to :possession_phase
  has_many :principle_steps, dependent: :destroy

  accepts_nested_attributes_for :principle_steps

  validates :description, presence: true
  validates :hex_color, presence: true
  validates :icon, presence: true
  validates :name, presence: true
  validates :possession_phase, presence: true
  validates :tagline, presence: true
end
