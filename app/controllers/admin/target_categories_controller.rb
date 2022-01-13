# frozen_string_literal: true

module Admin
  class TargetCategoriesController < AdminController
    before_action { add_breadcrumb(_('Target categories'), admin_target_categories_path) }

    def index
      @target_categories = TargetCategory.all
    end

    private

    def model
      TargetCategory
    end

    def safe_params
      params.require(:target_category).permit(:name)
    end
  end
end
