# frozen_string_literal: true

module Admin
  module Equipment
    class LocationsController < EquipmentController
      before_action { add_breadcrumb(_('Locations'), admin_equipment_locations_path) }

      def index
        @locations = ::Equipment::Location.arrange
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

      def show
        @location = ::Equipment::Location.find(params[:id])
      end

      def update
        @location = ::Equipment::Location.find(params[:id])

        if @location.update(safe_params)
          redirect_to admin_equipment_locations_path
        else
          render :show
        end
      end

      private

      def safe_params
        params.require(:equipment_location).permit(:name, :owner, :parent_id)
      end
    end
  end
end
