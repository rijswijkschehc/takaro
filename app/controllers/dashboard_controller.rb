# frozen_string_literal: true

class DashboardController < PrivateController
  def show
    authorize(:dashboard, :show?)
  end
end
