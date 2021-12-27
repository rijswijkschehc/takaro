# frozen_string_literal: true

ParameterType(name: 'does_or_not',
              regexp: /(does|does not)/,
              transformer: ->(token) { token.strip.ends_with?('not') ? :not_to : :to })

ParameterType(name: 'location',
              regexp: /.*/,
              transformer: lambda do |name_with_ancestry|
                *ancestors, name = name_with_ancestry.split(' / ')
                ancestry = Equipment::Location.where(name: ancestors).pluck(:id).join('/')
                Equipment::Location.find_by(ancestry: ancestry, name: name)
              end)

ParameterType(name: 'period',
              regexp: /(?:period)?\s*"([^"]+)"/,
              transformer: ->(name) { Period.find_by(name: name) })

ParameterType(name: 'user',
              regexp: /(?:user)?\s*"([^"]+)"/,
              transformer: ->(name) { User.find_by(email: "#{name.parameterize}@takaro.test") })
