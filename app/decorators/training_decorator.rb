# frozen_string_literal: true

class TrainingDecorator < ApplicationDecorator
  delegate :objective, :title

  decorates_association :principles
  decorates_association :step

  def creator
    GlobalID::Locator.locate(model.versions.first.whodunnit).screen_name
  end
end
