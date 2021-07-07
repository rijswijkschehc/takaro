# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  delegate :creator, :persisted?, :to_key
end
