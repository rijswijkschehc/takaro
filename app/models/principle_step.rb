# frozen_string_literal: true

class PrincipleStep < ApplicationRecord
  has_paper_trail only: %i[description]
  has_rich_text :description

  belongs_to :principle
  belongs_to :step

  validates :description, presence: true
end
