# frozen_string_literal: true

module Equipment
  class Lock < ApplicationRecord
    has_paper_trail only: %i[code number location_id]

    belongs_to :location, optional: true

    scope :available, ->(location) { where(location: [nil, location.id]) }

    validates :number, uniqueness: true
  end
end
