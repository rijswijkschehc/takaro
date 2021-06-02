# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout -> { user_signed_in? ? 'private' : 'public' }

  before_action :set_paper_trail_whodunnit
  before_action :set_sentry_user

  def user_for_paper_trail
    current_user
  end

  private

  def set_sentry_user
    return if current_user.blank?

    Sentry.set_user(id: current_user.id, email: current_user.email)
  end
end
