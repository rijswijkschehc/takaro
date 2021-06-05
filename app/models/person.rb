# frozen_string_literal: true

class Person < ApplicationRecord
  has_paper_trail only: %i[screen_name]

  belongs_to :user

  validates :screen_name, presence: true, length: { maximum: 50 }
  validates :user, presence: true
end
