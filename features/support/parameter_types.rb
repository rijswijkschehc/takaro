# frozen_string_literal: true

ParameterType(name: 'does_or_not',
              regexp: /(does|does not)/,
              transformer: ->(token) { token.strip.ends_with?('not') ? :not_to : :to })

ParameterType(name: 'period',
              regexp: /(?:period)?\s*"([^"]+)"/,
              transformer: ->(name) { Period.find_by(name: name) })
