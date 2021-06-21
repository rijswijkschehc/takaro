# frozen_string_literal: true

class TechniqueDecorator < ApplicationDecorator
  def badge
    h.tag.span(model.name, class: 'badge bg-warning')
  end
end
