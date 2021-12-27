# frozen_string_literal: true

class PeriodsController < PrivateController
  before_action { add_breadcrumb(_('Seasonal buildup'), periods_path) }

  def index
    @periods = Period.order(:starts_on)
  end

  def show
    @period = Period.includes(
      period_principles: %i[principle rich_text_description rich_text_match_tips rich_text_training_tips]
    ).find(params[:id])

    add_breadcrumb(@period.name)
  end
end
