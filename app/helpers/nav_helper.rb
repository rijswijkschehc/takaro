# frozen_string_literal: true

module NavHelper
  def navbar_toggler(target:)
    tag.button(class: 'navbar-toggler', type: :button, data: { bs: { toggle: 'collapse', target: target } }) do
      tag.span(class: 'navbar-toggler-icon')
    end
  end
end
