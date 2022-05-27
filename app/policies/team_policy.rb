# frozen_string_literal: true

class TeamPolicy < PrivatePolicy
  def show?
    user.admin? || record.users.include?(user)
  end

  def edit?
    show?
  end

  def update?
    show?
  end
end
