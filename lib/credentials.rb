# frozen_string_literal: true

class Credentials
  def self.fetch(*keys)
    value = Rails.application.credentials.public_send(keys.shift)
    value.is_a?(String) ? value : value.dig(*keys)
  rescue NoMethodError
    raise KeyError
  end
end
