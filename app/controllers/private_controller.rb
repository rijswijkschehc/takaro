# frozen_string_literal: true

class PrivateController < ApplicationController
  include Pundit

  before_action :authenticate_user!
  before_action :authorize_action
  before_action :set_periods
  after_action :verify_authorized

  private

  def set_periods
    @periods = Period.order(:starts_on)
  end

  def authorize_action
    raise NotImplementedError, "#{self.class}#authorize_action"
  end
end
