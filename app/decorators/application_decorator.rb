# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  delegate :email, :created_at
end
