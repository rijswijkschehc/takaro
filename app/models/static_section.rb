# frozen_string_literal: true

class StaticSection < ApplicationRecord
  has_paper_trail only: %i[content identifier name]
  has_rich_text :content

  validates :identifier, presence: true, uniqueness: true
end
