# frozen_string_literal: true

class DashboardController < PrivateController
  def show; end

  private

  def authorize_action
    authorize(:dashboard, :show?)
  end
end
