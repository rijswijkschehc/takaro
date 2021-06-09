# frozen_string_literal: true

module Admin
  class TargetCategoriesController < AdminController
    def index
      @target_categories = TargetCategory.all
    end

    def new; end

    def create
      if @target_category.update(safe_params)
        redirect_to admin_target_categories_path
      else
        render :new
      end
    end

    def show; end

    def update
      if @target_category.update(safe_params)
        redirect_to admin_target_categories_path
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:target_category).permit(:name)
    end

    def authorize_action
      @target_category =
        case action_name
        when 'index' then authorize(TargetCategory)
        when 'new', 'create' then authorize(TargetCategory.new)
        when 'show', 'update' then authorize(TargetCategory.find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
