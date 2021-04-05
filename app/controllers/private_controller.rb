# frozen_string_literal: true

class PrivateController < ApplicationController
  include Pundit

  before_action :authenticate_user!
  before_action :authorize_action
  after_action :verify_authorized

  private

  def authorize_action
    raise NotImplementedError, "#{self.class}#authorize_action"
  end
end
