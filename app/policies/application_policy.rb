# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  private

  def contributors
    GlobalID::Locator.locate_many(record.versions.pluck(:whodunnit)).uniq
  end
end
