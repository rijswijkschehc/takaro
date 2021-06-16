# frozen_string_literal: true

Sentry.init do |config|
  config.async = lambda do |event, hint|
    Sentry::SendEventJob.perform_later(event, hint)
  end

  config.enabled_environments = %w[production]
  config.dsn = Credentials.fetch(:sentry, :dsn)
  config.breadcrumbs_logger = [:active_support_logger]
  config.traces_sampler = lambda do |sampling_context|
    next sampling_context[:parent_sampled] unless sampling_context[:parent_sampled].nil?

    case sampling_context.dig(:transaction_context, :name)
    when %r{admin/sidekiq}
      0.0
    else
      1.0
    end
  end
end
