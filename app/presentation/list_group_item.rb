# frozen_string_literal: true

class ListGroupItem < PresentationCore
  attr_reader :content, :path, :actionable, :active, :disabled, :flavor

  OPTIONS = {
    actionable: [true, false],
    active: [true, false],
    disabled: [true, false],
    flavor: [nil, :primary, :secondary, :success, :danger, :warning, :info, :light, :dark]
  }.freeze

  def initialize(content:, path:, options:)
    super(options: options)

    @content = content
    @path = path
  end

  def html
    tag.send(element, content, **attributes)
  end

  private

  def element
    actionable ? :a : :li
  end

  def attributes
    {}.tap do |h|
      h[:href] = path if actionable
      h[:class] = classes
    end
  end

  def classes
    %w[list-group-item].tap do |a|
      a << 'list-group-item-action' if actionable
      a << "list-group-item-#{flavor}" if flavor
      a << 'active' if active
      a << 'disabled' if disabled
    end
  end
end
