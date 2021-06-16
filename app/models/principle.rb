# frozen_string_literal: true

class Principle < ApplicationRecord
  acts_as_list
  has_paper_trail only: %i[description hex_color icon name position possession_phase_id tagline]
  has_rich_text :description

  default_scope { order(:position) }

  belongs_to :possession_phase
  has_many :period_principles, dependent: :destroy
  has_many :principle_steps, dependent: :destroy

  accepts_nested_attributes_for :principle_steps

  validates :description, presence: true
  validates :hex_color, presence: true, length: { is: 6 }
  validates :icon, presence: true
  validates :name, presence: true
  validates :possession_phase, presence: true
  validates :tagline, presence: true
end
