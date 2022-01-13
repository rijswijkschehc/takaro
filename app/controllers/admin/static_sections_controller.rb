# frozen_string_literal: true

module Admin
  class StaticSectionsController < AdminController
    before_action { add_breadcrumb(_('Static sections'), admin_static_sections_path) }

    def index
      @static_sections = StaticSection.order(name: :asc)
    end

    private

    def model
      StaticSection
    end

    def safe_params
      params.require(:static_section).permit(:content, :name)
    end
  end
end
