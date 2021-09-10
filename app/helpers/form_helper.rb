# frozen_string_literal: true

module FormHelper
  def ancestry_dropdown(items:)
    [].tap do |result|
      items.map do |item, children|
        result << [('- ' * item.depth) + item.name, item.id]
        result.concat(ancestry_dropdown(items: children)) if children.present?
      end
    end
  end
end
