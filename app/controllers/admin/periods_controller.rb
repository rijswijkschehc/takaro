# frozen_string_literal: true

module Admin
  class PeriodsController < AdminController
    def index
      @periods = Period.all
    end

    def new; end

    def create
      if @period.update(safe_params)
        redirect_to admin_periods_path
      else
        render :new
      end
    end

    def show; end

    def update
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

    def authorize_action
      @period =
        case action_name
        when 'index' then authorize(Period)
        when 'new', 'create' then authorize(Period.new)
        when 'show', 'update' then authorize(Period.includes(
          period_principles: %i[rich_text_description rich_text_match_tips rich_text_training_tips]
        ).find(params[:id]))
        else
          raise NotAuthorizedError
        end
    end
  end
end
