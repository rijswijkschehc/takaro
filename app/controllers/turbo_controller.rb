# frozen_string_literal: true

require_relative '../../lib/action_controller/turbo_responder'

class TurboController < ApplicationController
  self.responder = ActionController::TurboResponder
  respond_to :html, :turbo_stream
end
