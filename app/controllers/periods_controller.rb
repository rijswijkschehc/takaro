# frozen_string_literal: true

class PeriodsController < PrivateController
  def show
    @period = Period.includes(
      period_principles: %i[principle rich_text_description rich_text_match_tips rich_text_training_tips]
    ).find(params[:id])
  end

  private

  def authorize_action
    authorize(Period)
  end
end
