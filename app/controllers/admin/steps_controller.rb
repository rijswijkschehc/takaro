# frozen_string_literal: true

module Admin
  class StepsController < AdminController
    include Sortable

    before_action { add_breadcrumb(_('Steps'), admin_steps_path) }

    def index
      @steps = Step.all
    end

    def new
      @step = Step.new
    end

    def create
      @step = Step.new(safe_params)

      if @step.save
        redirect_to admin_steps_path
      else
        render :new
      end
    end

    def show
      @step = Step.find(params[:id])
    end

    def update
      @step = Step.find(params[:id])

      if @step.update(safe_params)
        redirect_to admin_steps_path
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:step).permit(:description, :icon, :name)
    end
  end
end
