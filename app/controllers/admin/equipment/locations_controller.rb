# frozen_string_literal: true

module Admin
  module Equipment
    class LocationsController < EquipmentController
      before_action { add_breadcrumb(_('Locations'), admin_equipment_locations_path) }
      before_action :set_location, only: %i[show update]
      before_action :set_available_locks, only: %i[new show update]

      def index
        @locations = ::Equipment::Location.includes(:lock).arrange(order: :name)
      end

      def new
        @location = ::Equipment::Location.new
      end

      def create
        @location = ::Equipment::Location.new(safe_params)

        if @location.save
          redirect_to admin_equipment_locations_path
        else
          render :new
        end
      end

      def show; end

      def update
        if @location.update(safe_params)
          redirect_to admin_equipment_locations_path
        else
          render :show
        end
      end

      private

      def safe_params
        params.require(:equipment_location).permit(:lock_id, :name, :owner, :parent_id)
      end

      def set_location
        @location = ::Equipment::Location.find(params[:id])
      end

      def set_available_locks
        @available_locks = ::Equipment::Lock.available(@location).order(:number)
      end
    end
  end
end
