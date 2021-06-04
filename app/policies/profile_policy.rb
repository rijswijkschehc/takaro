# frozen_string_literal: true

ProfilePolicy = Struct.new(:user, :profile) do
  def show?
    user.present?
  end
end
