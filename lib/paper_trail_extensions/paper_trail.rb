# frozen_string_literal: true

module PaperTrailExtensions
  module PaperTrail
    def whodunnit=(value)
      value = value.respond_to?(:to_gid) ? value.to_gid.to_s : value

      if defined?(request)
        request.whodunnit = value
      else
        super(value)
      end
    end

    def actor
      ::GlobalID::Locator.locate(whodunnit) || whodunnit
    end
  end
end
