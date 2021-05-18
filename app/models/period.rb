# frozen_string_literal: true

class Period < ApplicationRecord
  has_paper_trail only: %i[name position]

  validates :name, presence: true
end
