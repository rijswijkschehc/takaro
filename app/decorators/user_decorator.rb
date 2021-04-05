# frozen_string_literal: true

class UserDecorator < ApplicationDecorator
  decorates_association :roles
end
