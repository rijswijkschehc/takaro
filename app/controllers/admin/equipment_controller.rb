# frozen_string_literal: true

module Admin
  class EquipmentController < AdminController
    before_action { add_breadcrumb(_('Equipment'), admin_equipment_path) }

    private

    def model; end

    def authorize_user
      authorize(self.class, policy_class: EquipmentPolicy)
    end
  end
end
