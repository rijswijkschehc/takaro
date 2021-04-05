# frozen_string_literal: true

module ButtonHelper
  def button(content: nil, path: nil, **options)
    Button.new(content: content, path: path, options: options).html
  end

  def button_group(items:, **options)
    ButtonGroup.new(items: items, options: options).html
  end
end
