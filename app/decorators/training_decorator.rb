# frozen_string_literal: true

class TrainingDecorator < ApplicationDecorator
  delegate :title

  decorates_association :principles

  def creator
    GlobalID::Locator.locate(model.versions.first.whodunnit).screen_name
  end
end
