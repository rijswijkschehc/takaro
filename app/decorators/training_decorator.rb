# frozen_string_literal: true

class TrainingDecorator < ApplicationDecorator
  delegate :comments, :objective, :title

  decorates_association :principles
  decorates_association :step
end
