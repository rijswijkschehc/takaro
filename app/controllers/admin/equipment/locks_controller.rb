# frozen_string_literal: true

module Admin
  module Equipment
    class LocksController < EquipmentController
      before_action { add_breadcrumb(_('Locks'), admin_equipment_locks_path) }

      def index
        @locks = ::Equipment::Lock.order(:number)
      end

      def new
        @lock = ::Equipment::Lock.new
      end

      def create
        @lock = ::Equipment::Lock.new(safe_params)

        if @lock.save
          redirect_to admin_equipment_locks_path
        else
          render :new
        end
      end

      def show
        @lock = ::Equipment::Lock.find(params[:id])
      end

      def update
        @lock = ::Equipment::Lock.find(params[:id])

        if @lock.update(safe_params)
          redirect_to admin_equipment_locks_path
        else
          render :show
        end
      end

      private

      def safe_params
        params.require(:equipment_lock).permit(:code, :location_id, :number)
      end
    end
  end
end
