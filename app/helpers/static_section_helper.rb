# frozen_string_literal: true

module StaticSectionHelper
  def render_static_section(identifier:)
    StaticSection.find_by!(identifier: identifier).content
  rescue ActiveRecord::RecordNotFound
    Sentry.capture_message("StaticSection with identifier: '#{identifier}' could not be found") and return
  end
end
