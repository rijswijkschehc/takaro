# frozen_string_literal: true

module Roles
  extend ActiveSupport::Concern

  def superuser?
    has_role?(:superuser)
  end

  def admin?
    has_any_role?(:superuser, :administrator)
  end
end
