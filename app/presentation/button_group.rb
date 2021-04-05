# frozen_string_literal: true

class ButtonGroup < PresentationCore
  attr_reader :items, :size

  OPTIONS = {
    size: [nil, :sm, :lg]
  }.freeze

  def initialize(items:, options:)
    super(options: options)

    @items = items
  end

  def html
    tag.div(safe_join(items), **attributes)
  end

  private

  def attributes
    {}.tap do |h|
      h[:role] = 'group'
      h[:class] = classes
    end
  end

  def classes
    %w[btn-group].tap do |a|
      a << "btn-group-#{size}" if size
    end
  end
end
