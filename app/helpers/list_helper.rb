# frozen_string_literal: true

module ListHelper
  def list_group_item(content: nil, path: nil, **options)
    ListGroupItem.new(content: content, path: path, options: options).html
  end

  def list_group(items:, **options)
    ListGroup.new(items: items, options: options).html
  end
end
