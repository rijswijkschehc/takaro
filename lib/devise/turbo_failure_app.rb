# frozen_string_literal: true

module Devise
  class TurboFailureApp < Devise::FailureApp
    def respond
      request_format == :turbo_stream ? redirect : super
    end

    def skip_format?
      %w[html turbo_stream */*].include?(request_format.to_s)
    end
  end
end
