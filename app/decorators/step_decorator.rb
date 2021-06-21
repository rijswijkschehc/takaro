# frozen_string_literal: true

class StepDecorator < ApplicationDecorator
  def badge
    h.tag.span(model.name, class: 'badge bg-dark')
  end
end
