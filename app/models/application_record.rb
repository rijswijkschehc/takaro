# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def creator
    GlobalID::Locator.locate(versions.first.whodunnit)
  end
end
