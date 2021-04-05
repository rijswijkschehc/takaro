# frozen_string_literal: true

Sentry.init do |config|
  config.enabled_environments = %w[production]
  config.dsn = Credentials.fetch(:sentry, :dsn)
  config.breadcrumbs_logger = [:active_support_logger]
  config.traces_sample_rate = 1.0
end
