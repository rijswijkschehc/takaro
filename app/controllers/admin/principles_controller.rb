# frozen_string_literal: true

module Admin
  class PrinciplesController < AdminController
    before_action { add_breadcrumb(_('Principles'), admin_principles_path) }

    include Sortable

    def index
      @principles = Principle.order(:position)
    end

    def new
      @principle = Principle.new
      find_or_initialize_steps
    end

    def create
      @principle = Principle.new(safe_params)

      if @principle.save
        redirect_to admin_principles_path
      else
        render :new
      end
    end

    def show
      @principle = Principle.find(params[:id])
    end

    def update
      @principle = Principle.find(params[:id])

      if @principle.update(safe_params)
        redirect_to admin_principles_path
      else
        render :show
      end
    end

    private

    def find_or_initialize_steps
      Step.all.each.map { |step| @principle.principle_steps.find_or_initialize_by(step: step) }
    end

    def safe_params
      params.require(:principle).permit(:description, :hex_color, :icon, :name, :possession_phase_id, :tagline,
                                        principle_steps_attributes: %i[description id step_id tagline])
    end
  end
end
