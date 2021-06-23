# frozen_string_literal: true

module Admin
  class TargetCategoriesController < AdminController
    def index
      @target_categories = authorize(TargetCategory.all)
    end

    def new
      @target_category = authorize(TargetCategory.new)
    end

    def create
      @target_category = authorize(TargetCategory.new(safe_params))

      if @target_category.save
        redirect_to admin_target_categories_path
      else
        render :new
      end
    end

    def show
      @target_category = authorize(TargetCategory.find(params[:id]))
    end

    def update
      @target_category = authorize(TargetCategory.find(params[:id]))

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
  end
end
