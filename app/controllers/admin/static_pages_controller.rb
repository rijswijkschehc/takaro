# frozen_string_literal: true

module Admin
  class StaticPagesController < AdminController
    def index
      @static_pages = StaticPage.all
    end

    def new; end

    def create
      if @static_page.update(safe_params)
        redirect_to admin_static_pages_path
      else
        render :new
      end
    end

    def show; end

    def update
      if @static_page.update(safe_params)
        redirect_to admin_static_page_path(@static_page)
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:static_page).permit(:content, :path, :title)
    end

    def authorize_action
      @static_page =
        case action_name
        when 'index' then authorize(StaticPage)
        when 'new', 'create' then authorize(StaticPage.new)
        when 'show', 'update' then authorize(StaticPage.find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
