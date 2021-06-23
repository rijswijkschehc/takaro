# frozen_string_literal: true

class AdminController < PrivateController
  private

  def authorize_user
    authorize([:admin, constant_from_controller_name])
  end
end
