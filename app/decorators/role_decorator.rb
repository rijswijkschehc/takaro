# frozen_string_literal: true

class RoleDecorator < ApplicationDecorator
  def badge
    h.tag.span(model.name, class: 'badge bg-secondary')
  end
end
