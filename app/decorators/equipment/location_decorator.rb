# frozen_string_literal: true

module Equipment
  class LocationDecorator < ApplicationDecorator
    delegate :name, :owner

    decorates_association :lock

    def breadcrumb_name
      name
    end

    def name_with_ancestry
      model.path.pluck(:name).join(' / ')
    end
  end
end
