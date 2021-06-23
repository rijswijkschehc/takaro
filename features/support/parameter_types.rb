# frozen_string_literal: true

ParameterType(name: 'period',
              regexp: /(?:period)?\s*"([^"]+)"/,
              transformer: ->(name) { Period.find_by(name: name) })
