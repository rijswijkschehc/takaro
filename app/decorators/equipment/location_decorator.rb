# frozen_string_literal: true

module Equipment
  class LocationDecorator < ApplicationDecorator
    delegate :name, :owner

    decorates_association :lock
  end
end
