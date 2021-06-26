# frozen_string_literal: true

class ExercisePolicy < PrivatePolicy
  def update?
    user.admin? || contributors.include?(user)
  end
end
