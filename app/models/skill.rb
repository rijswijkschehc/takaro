# frozen_string_literal: true

class Skill < ApplicationRecord
  has_paper_trail only: %i[description name]
  has_rich_text :description

  validates :name, presence: true
  validates :description, presence: true
end
