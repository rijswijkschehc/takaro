# frozen_string_literal: true

module Equipment
  class Location < ApplicationRecord
    acts_as_list
    has_ancestry orphan_strategy: :restrict
    has_paper_trail only: %i[name ancestry owner]

    belongs_to :parent, class_name: 'Equipment::Location', optional: true
    has_one :lock, class_name: 'Equipment::Lock', dependent: :nullify

    validates :name, presence: true, format: { without: %r{/} }, uniqueness: { scope: :ancestry }

    def lock_id
      lock&.id
    end

    def lock_id=(value)
      self.lock = Lock.find(value) if value.present?
    end
  end
end
