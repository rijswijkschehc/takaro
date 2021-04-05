# frozen_string_literal: true

User.new(email: 'platform@takaro.nl', password: Devise.friendly_token).tap do |u|
  u.confirm
  u.add_role(:platform)
  u.save
end
