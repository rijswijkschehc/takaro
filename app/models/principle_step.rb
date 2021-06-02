# frozen_string_literal: true

class PrincipleStep < ApplicationRecord
  has_paper_trail only: %i[description tag_line]
  has_rich_text :description

  belongs_to :principle
  belongs_to :step

  validates :description, presence: true
  validates :tag_line, presence: true
end
