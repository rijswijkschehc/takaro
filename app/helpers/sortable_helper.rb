# frozen_string_literal: true

module SortableHelper
  def sortable_item(element:, item:, &block)
    tag.public_send(element, data: { id: item.id }) do
      capture(&block)
    end
  end

  def sortable_handle
    tag.span(
      icon(id: 'sort'),
      class: 'btn btn-sm btn btn-outline-secondary sortable-handle'
    )
  end
end
