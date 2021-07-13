# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Breadcrumbs
  include Pundit
  include SetSentryContext

  layout -> { user_signed_in? ? 'private' : 'public' }

  before_action { add_breadcrumb(_('RHC playing style')) }
  before_action :set_paper_trail_whodunnit
  before_action :set_locale

  private

  def set_locale
    I18n.locale = I18n.default_locale
  end

  def user_for_paper_trail
    current_user
  end
end
