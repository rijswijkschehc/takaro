# frozen_string_literal: true

require_relative './paper_trail'

module PaperTrailExtensions
  module ::PaperTrail
    class << self
      prepend ::PaperTrailExtensions::PaperTrail
    end
  end

  module ::PaperTrail
    module Request
      class << self
        prepend ::PaperTrailExtensions::PaperTrail
      end
    end
  end

  module ::PaperTrail
    module VersionConcern
      include ::PaperTrailExtensions::PaperTrail
    end
  end
end
