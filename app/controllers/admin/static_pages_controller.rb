# frozen_string_literal: true

module Admin
  class StaticPagesController < AdminController
    def index
      @static_pages = authorize(StaticPage.all)
    end

    def new
      @static_page = authorize(StaticPage.new)
    end

    def create
      @static_page = authorize(StaticPage.new(safe_params))

      if @static_page.save
        redirect_to admin_static_pages_path
      else
        render :new
      end
    end

    def show
      @static_page = authorize(StaticPage.find(params[:id]))
    end

    def update
      @static_page = authorize(StaticPage.find(params[:id]))

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
