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
    [namespaces, controller_name.classify].join('::').constantize
  end

  def namespaces
    self.class.module_parent.to_s.split('::').reject { |namespace| namespace == 'Admin' }.join('::')
  end
end
