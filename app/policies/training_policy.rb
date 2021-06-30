# frozen_string_literal: true

class TrainingPolicy < PrivatePolicy
  def edit?
    user.admin? || contributors.include?(user)
  end

  def update?
    edit?
  end
end
