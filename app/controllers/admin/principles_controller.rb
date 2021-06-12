# frozen_string_literal: true

module Admin
  class PrinciplesController < AdminController
    include Sortable

    before_action :find_or_initialize_steps, only: %i[new show]

    def index
      @principles = Principle.all
    end

    def new; end

    def create
      if @principle.update(safe_params)
        redirect_to admin_principles_path
      else
        render :new
      end
    end

    def show; end

    def update
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

    def authorize_action
      @principle =
        case action_name
        when 'index', 'reposition' then authorize(Principle)
        when 'new', 'create' then authorize(Principle.new)
        when 'show', 'update' then authorize(Principle.find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
