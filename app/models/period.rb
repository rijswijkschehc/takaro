# frozen_string_literal: true

class Period < ApplicationRecord
  has_paper_trail only: %i[description ends_on name position starts_on]
  has_rich_text :description

  has_many :period_principles, dependent: :destroy

  accepts_nested_attributes_for :period_principles, allow_destroy: true

  validates :description, presence: true
  validates :name, presence: true
end
