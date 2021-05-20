# frozen_string_literal: true

module Admin
  class StepsController < AdminController
    def index
      @steps = Step.all
    end

    def new; end

    def create
      if @step.update(safe_params)
        redirect_to admin_steps_path
      else
        render :new
      end
    end

    def show; end

    def update
      if @step.update(safe_params)
        redirect_to admin_step_path(@step)
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:step).permit(:description, :icon, :name)
    end

    def authorize_action
      @step =
        case action_name
        when 'index' then authorize(Step)
        when 'new', 'create' then authorize(Step.new)
        when 'show', 'update' then authorize(Step.find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
