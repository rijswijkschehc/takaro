# frozen_string_literal: true

module Admin
  class StepsController < AdminController
    include Sortable

    def index
      @steps = authorize(Step.all)
    end

    def new
      @step = authorize(Step.new)
    end

    def create
      @step = authorize(Step.new(safe_params))

      if @step.save
        redirect_to admin_steps_path
      else
        render :new
      end
    end

    def show
      @step = authorize(Step.find(params[:id]))
    end

    def update
      @step = authorize(Step.find(params[:id]))

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
