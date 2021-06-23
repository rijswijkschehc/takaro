# frozen_string_literal: true

module Admin
  class PrinciplesController < AdminController
    include Sortable

    before_action :find_or_initialize_steps, only: %i[new show]

    def index
      @principles = authorize(Principle.all)
    end

    def new
      @principle = authorize(Principle.new)
    end

    def create
      @principle = authorize(Principle.new(safe_params))

      if @principle.save
        redirect_to admin_principles_path
      else
        render :new
      end
    end

    def show
      @principle = authorize(Principle.find(params[:id]))
    end

    def update
      @principle = authorize(Principle.find(params[:id]))

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
