# frozen_string_literal: true

class Profile < ApplicationRecord
  has_paper_trail only: %i[screen_name]

  belongs_to :user

  has_one_attached :image

  validates :screen_name, presence: true, length: { maximum: 50 }
end
