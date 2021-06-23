# frozen_string_literal: true

module Admin
  class PeriodsController < AdminController
    def index
      @periods = Period.all
    end

    def new
      @period = Period.new
    end

    def create
      @period = Period.new(safe_params)

      if @period.save
        redirect_to admin_periods_path
      else
        render :new
      end
    end

    def show
      @period = Period.find(params[:id])
    end

    def update
      @period = Period.find(params[:id])

      if @period.update(safe_params)
        redirect_to admin_periods_path
      else
        render :show
      end
    end

    private

    def safe_params
      params.require(:period).permit(:description, :ends_on, :name, :starts_on,
                                     period_principles_attributes: %i[_destroy id description match_tips principle_id
                                                                      tagline training_tips])
    end
  end
end
