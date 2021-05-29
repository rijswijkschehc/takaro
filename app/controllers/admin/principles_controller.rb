# frozen_string_literal: true

module Admin
  class PrinciplesController < AdminController
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
        redirect_to admin_principle_path(@principle)
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:principle).permit(:description, :hex_color, :icon, :name, :possession_phase_id, :tagline)
    end

    def authorize_action
      @principle =
        case action_name
        when 'index' then authorize(Principle)
        when 'new', 'create' then authorize(Principle.new)
        when 'show', 'update' then authorize(Principle.find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
