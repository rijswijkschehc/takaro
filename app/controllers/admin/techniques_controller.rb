# frozen_string_literal: true

module Admin
  class TechniquesController < AdminController
    before_action { add_breadcrumb(_('Techniques'), admin_techniques_path) }

    def index
      @techniques = Technique.all
    end

    private

    def model
      Technique
    end

    def safe_params
      params.require(:technique).permit(:description, :grip, :name, :video)
    end
  end
end
