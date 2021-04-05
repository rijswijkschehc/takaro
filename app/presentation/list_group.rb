# frozen_string_literal: true

class ListGroup < PresentationCore
  attr_reader :items, :actionable, :flush

  OPTIONS = {
    actionable: [true, false],
    flush: [true, false]
  }.freeze

  def initialize(items:, options:)
    super(options: options)

    @items = items
  end

  def html
    tag.send(element, safe_join(items), **attributes)
  end

  private

  def element
    actionable ? :div : :ul
  end

  def attributes
    {}.tap do |h|
      h[:class] = classes
    end
  end

  def classes
    %w[list-group].tap do |a|
      a << 'list-group-flush' if flush
    end
  end
end
