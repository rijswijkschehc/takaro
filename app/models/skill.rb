# frozen_string_literal: true

class Skill < ApplicationRecord
  has_paper_trail only: %i[description name]
  has_rich_text :description

  validates :description, presence: true
  validates :name, presence: true
end
