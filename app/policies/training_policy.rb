# frozen_string_literal: true

class TrainingPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def show?
    user.present?
  end

  def update?
    user.present?
  end
end
