# frozen_string_literal: true

class InvalidPresentationOption < StandardError
  attr_accessor :option, :value

  def initialize(option:, value:)
    @option = option
    @value = value

    super
  end

  def message
    "'#{value}' is an invalid value for '#{option}'"
  end
end
