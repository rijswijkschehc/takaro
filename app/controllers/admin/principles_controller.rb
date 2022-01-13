# frozen_string_literal: true

module Admin
  class PrinciplesController < AdminController
    include Sortable

    before_action { add_breadcrumb(_('Principles'), admin_principles_path) }
    before_action :find_or_initialize_steps, only: %i[new]

    def index
      @principles = Principle.order(:position)
    end

    private

    def model
      Principle
    end

    def safe_params
      params.require(:principle).permit(:description, :hex_color, :icon, :name, :possession_phase_id, :tagline,
                                        principle_steps_attributes: %i[description id step_id tagline])
    end

    def find_or_initialize_steps
      Step.all.each.map { |step| @principle.principle_steps.find_or_initialize_by(step: step) }
    end
  end
end
