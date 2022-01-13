# frozen_string_literal: true

module Admin
  class StaticPagesController < AdminController
    before_action { add_breadcrumb(_('Static pages'), admin_static_pages_path) }

    def index
      @static_pages = model.all
    end

    private

    def model
      StaticPage
    end

    def safe_params
      params.require(:static_page).permit(:content, :path, :title)
    end
  end
end
