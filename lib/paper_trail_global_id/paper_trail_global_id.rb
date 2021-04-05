# frozen_string_literal: true

require_relative './paper_trail'

module PaperTrailGlobalId
  module ::PaperTrail
    class << self
      prepend ::PaperTrailGlobalId::PaperTrail
    end
  end

  module ::PaperTrail
    module Request
      class << self
        prepend ::PaperTrailGlobalId::PaperTrail
      end
    end
  end

  module ::PaperTrail
    module VersionConcern
      include ::PaperTrailGlobalId::PaperTrail
    end
  end
end
