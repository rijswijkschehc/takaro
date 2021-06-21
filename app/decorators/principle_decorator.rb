# frozen_string_literal: true

class PrincipleDecorator < ApplicationDecorator
  def badge
    h.tag.span(model.name, class: 'badge', style: { 'background:': "##{model.hex_color}" })
  end
end
