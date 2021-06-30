# frozen_string_literal: true

module Admin
  class StaticSectionsController < AdminController
    def index
      @static_sections = StaticSection.order(name: :asc)
    end

    def show
      @static_section = StaticSection.find(params[:id])
    end

    def update
      @static_section = StaticSection.find(params[:id])

      if @static_section.update(safe_params)
        redirect_to admin_static_sections_path
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:static_section).permit(:content, :name)
    end
  end
end
