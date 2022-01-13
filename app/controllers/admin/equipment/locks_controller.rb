# frozen_string_literal: true

module Admin
  module Equipment
    class LocksController < EquipmentController
      before_action { add_breadcrumb(_('Locks'), admin_equipment_locks_path) }

      def index
        @locks = ::Equipment::Lock.order(:number)
      end

      private

      def model
        ::Equipment::Lock
      end

      def safe_params
        params.require(:equipment_lock).permit(:code, :location_id, :number)
      end

      def authorize_user
        authorize(@location, policy_class: EquipmentPolicy)
      end
    end
  end
end
