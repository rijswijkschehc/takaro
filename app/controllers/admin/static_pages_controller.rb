# frozen_string_literal: true

module Admin
  class StaticPagesController < AdminController
    before_action { add_breadcrumb(_('Static pages'), admin_static_pages_path) }

    def index
      @static_pages = StaticPage.all
    end

    def new
      @static_page = StaticPage.new
    end

    def create
      @static_page = StaticPage.new(safe_params)

      if @static_page.save
        redirect_to admin_static_pages_path
      else
        render :new
      end
    end

    def show
      @static_page = StaticPage.find(params[:id])
    end

    def update
      @static_page = StaticPage.find(params[:id])

      if @static_page.update(safe_params)
        redirect_to admin_static_pages_path
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:static_page).permit(:content, :path, :title)
    end
  end
end
