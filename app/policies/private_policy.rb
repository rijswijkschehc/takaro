# frozen_string_literal: true

class PrivatePolicy < ApplicationPolicy
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
end
