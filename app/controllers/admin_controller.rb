# frozen_string_literal: true

class AdminController < PrivateController
  before_action { add_breadcrumb(_('Admin')) }

  private

  def authorize_user
    authorize([:admin, constant_from_controller_name])
  end
end
