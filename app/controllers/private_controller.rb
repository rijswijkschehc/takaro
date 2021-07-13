# frozen_string_literal: true

class PrivateController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user
  after_action :verify_authorized

  private

  def authorize_user
    authorize(constant_from_controller_name)
  end

  def constant_from_controller_name
    controller_name.classify.constantize
  end
end
