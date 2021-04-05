# frozen_string_literal: true

class Button < PresentationCore
  attr_reader :content, :path, :remote, :method, :flavor, :outline, :size, :stimulus

  OPTIONS = {
    remote: [nil, true],
    method: [nil, :delete],
    flavor: %i[primary secondary success danger warning info light dark link],
    outline: [true, false],
    size: [nil, :sm, :lg]
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
    path.present? ? :a : :button
  end

  def attributes
    {}.tap do |h|
      h[:type] = 'button' if element == :button
      h[:href] = path if path
      h[:rel] = 'nofollow' if method
      h[:class] = classes
      h.merge!(data: data_attributes)
    end
  end

  def data_attributes
    {}.tap do |h|
      h[:method] = method if method
      h[:remote] = remote if remote
      h.merge!(stimulus) if stimulus
    end
  end

  def classes
    %w[btn].tap do |a|
      a << style
      a << "btn-#{size}" if size
    end
  end

  def style
    %w[btn].tap do |a|
      a << 'outline' if outline
      a << flavor
    end.join('-')
  end
end
