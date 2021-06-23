# frozen_string_literal: true

module Admin
  class StepPolicy < AdminPolicy
    def reposition?
      update?
    end
  end
end
