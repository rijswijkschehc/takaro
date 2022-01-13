# frozen_string_literal: true

module Admin
  class StepsController < AdminController
    include Sortable

    before_action { add_breadcrumb(_('Steps'), admin_steps_path) }

    def index
      @steps = Step.all
    end

    private

    def model
      Step
    end

    def safe_params
      params.require(:step).permit(:description, :icon, :name)
    end
  end
end
