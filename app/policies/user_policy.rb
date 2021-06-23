# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    user.admin? || user == record
  end

  def update?
    show?
  end
end
