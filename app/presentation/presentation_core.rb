# frozen_string_literal: true

require_relative '../../lib/errors/invalid_presentation_option'

class PresentationCore
  include ActionView::Helpers::TagHelper

  def initialize(options: nil)
    return unless options

    validate_options(options: options)
    assign_attributes(attributes: options)
  end

  private

  def validate_options(options:)
    options.each do |option, value|
      next if option == :stimulus || self.class::OPTIONS[option].include?(value)

      raise InvalidPresentationOption.new(option: option, value: value)
    end
  end

  def assign_attributes(attributes:)
    attributes.each do |attribute, value|
      instance_variable_set("@#{attribute}", value)
    end
  end
end
