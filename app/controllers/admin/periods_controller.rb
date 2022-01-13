# frozen_string_literal: true

module Admin
  class PeriodsController < AdminController
    before_action { add_breadcrumb(_('Periods'), admin_periods_path) }

    def index
      @periods = Period.all
    end

    private

    def model
      Period
    end

    def safe_params
      params.require(:period).permit(:description, :ends_on, :name, :starts_on,
                                     period_principles_attributes: %i[_destroy id description match_tips principle_id
                                                                      tagline training_tips])
    end
  end
end
