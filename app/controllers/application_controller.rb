# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout -> { user_signed_in? ? 'private' : 'public' }

  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    current_user
  end
end
