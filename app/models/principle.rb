# frozen_string_literal: true

class Principle < ApplicationRecord
  has_paper_trail only: %i[description hex_color icon name tagline]
  has_rich_text :description

  validates :description, presence: true
  validates :hex_color, presence: true
  validates :icon, presence: true
  validates :name, presence: true
  validates :tagline, presence: true
end
