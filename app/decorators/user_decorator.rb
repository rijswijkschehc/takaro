# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  delegate :email, :created_at

  decorates_association :roles
end
