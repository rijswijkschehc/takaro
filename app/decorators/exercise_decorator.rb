# frozen_string_literal: true

class ExerciseDecorator < ApplicationDecorator
  delegate :comments, :description, :objective, :tips, :title, :variation

  decorates_association :principles
  decorates_association :step
  decorates_association :techniques
end
