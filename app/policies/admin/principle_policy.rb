# frozen_string_literal: true

module Admin
  class PrinciplePolicy < AdminPolicy
    def reposition?
      update?
    end
  end
end
