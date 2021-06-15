# frozen_string_literal: true

class PeriodPrinciple < ApplicationRecord
  has_paper_trail only: %i[description match_tips training_tips tagline]
  has_rich_text :description
  has_rich_text :match_tips
  has_rich_text :training_tips

  belongs_to :period
  belongs_to :principle

  validates :description, presence: true
  validates :tagline, presence: true
end
