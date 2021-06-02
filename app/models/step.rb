# frozen_string_literal: true

class Step < ApplicationRecord
  acts_as_list
  has_paper_trail only: %i[description icon name position]
  has_rich_text :description

  default_scope { order(:position) }

  has_many :principle_steps, dependent: :destroy

  validates :description, presence: true
  validates :icon, presence: true
  validates :name, presence: true
end
