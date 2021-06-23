# frozen_string_literal: true

class PrivateController < ApplicationController
  include Pundit

  before_action :authenticate_user!
  after_action :verify_authorized
end
