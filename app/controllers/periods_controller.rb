# frozen_string_literal: true

class PeriodsController < PrivateController
  def show
    @period = Period.find(params[:id])
  end

  private

  def authorize_action
    authorize(Period)
  end
end
