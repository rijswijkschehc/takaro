# frozen_string_literal: true

module Admin
  class EquipmentPolicy < AdminPolicy
    def index?
      user.has_role?(:equipment) || super
    end

    def new?
      user.has_role?(:equipment) || super
    end

    def create?
      user.has_role?(:equipment) || super
    end

    def show?
      user.has_role?(:equipment) || super
    end

    def edit?
      user.has_role?(:equipment) || super
    end

    def update?
      user.has_role?(:equipment) || super
    end

    def destroy?
      user.has_role?(:equipment) || super
    end
  end
end
