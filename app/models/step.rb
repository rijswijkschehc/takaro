# frozen_string_literal: true

class Step < ApplicationRecord
  has_paper_trail only: %i[description icon name]
  has_rich_text :description

  validates :description, presence: true
  validates :icon, presence: true
  validates :name, presence: true
end
