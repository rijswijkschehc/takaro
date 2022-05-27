# frozen_string_literal: true

class PeriodsController < PrivateController
  prepend_before_action :set_period, only: %i[show]
  before_action { add_breadcrumb(_('Seasonal buildup'), periods_path) }

  def index
    @periods = Period.order(:starts_on)
  end

  def show
    add_breadcrumb(@period.name)
  end

  private

  def set_period
    @period = Period.includes(
      period_principles: %i[principle rich_text_description rich_text_match_tips rich_text_training_tips]
    ).find(params[:id])
  end

  def authorize_user
    authorize(@period || Period)
  end
end
