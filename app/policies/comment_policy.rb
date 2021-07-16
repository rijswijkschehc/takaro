# frozen_string_literal: true

class CommentPolicy < PrivatePolicy
  def edit?
    user.admin? || user == record.creator
  end

  def update?
    edit?
  end

  def reload?
    true
  end

  def destroy?
    edit?
  end
end
