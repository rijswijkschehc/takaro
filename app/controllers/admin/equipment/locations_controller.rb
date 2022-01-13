# frozen_string_literal: true

module Admin
  module Equipment
    class LocationsController < EquipmentController
      include Sortable

      before_action { add_breadcrumb(_('Locations'), admin_equipment_locations_path) }
      before_action :set_available_locks, only: %i[new show update]

      def index
        @locations = model.includes(:lock).arrange(order: %i[position name])
      end

      private

      def model
        ::Equipment::Location
      end

      def safe_params
        params.require(:equipment_location).permit(:lock_id, :name, :owner, :parent_id)
      end

      def authorize_user
        authorize(@location, policy_class: EquipmentPolicy)
      end

      def set_available_locks
        @available_locks = ::Equipment::Lock.available(@location).order(:number)
      end
    end
  end
end
