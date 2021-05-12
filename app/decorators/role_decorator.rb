# frozen_string_literal: true

class RoleDecorator < ApplicationDecorator
  delegate :name

  def badge
    h.tag.span(name, class: 'badge bg-secondary')
  end
end
