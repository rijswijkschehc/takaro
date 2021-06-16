# frozen_string_literal: true

module SetSentryContext
  extend ActiveSupport::Concern

  included do
    before_action :set_sentry_context
  end

  private

  def set_sentry_context
    Sentry.configure_scope do |scope|
      scope.set_tag(:locale, I18n.locale)

      if current_user.present?
        scope.set_user(id: current_user.id, name: current_user.screen_name, email: current_user.email)
      end
    end
  end
end
