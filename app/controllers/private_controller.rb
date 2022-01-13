# frozen_string_literal: true

class PrivateController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user
  after_action :verify_authorized
end
