# frozen_string_literal: true

class Badge < PresentationCore
  attr_reader :content, :flavor

  OPTIONS = {
    flavor: %i[primary secondary success danger warning info light dark]
  }.freeze

  DEFAULT_OPTIONS = {
    flavor: :secondary
  }.freeze

  def initialize(content:, options: DEFAULT_OPTIONS)
    super(options: options)

    @content = content
  end

  def html
    tag.span(content, **attributes)
  end

  private

  def attributes
    {}.tap do |h|
      h[:class] = classes
    end
  end

  def classes
    %w[badge].tap do |a|
      a << "bg-#{flavor}"
    end
  end
end
