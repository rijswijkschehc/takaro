# frozen_string_literal: true

class RoleDecorator < ApplicationDecorator
  def badge
    Badge.new(content: name).html
  end
end
