# frozen_string_literal: true

class RoleDecorator < ApplicationDecorator
  delegate :name

  def badge
    Badge.new(content: name).html
  end
end
