# frozen_string_literal: true

class PeriodDecorator < ApplicationDecorator
  delegate :description, :name, :period_principles

  def interval
    format(_('From %<start>s to %<end>s'),
           start: l(model.starts_on, format: '%e %B'),
           end: l(model.ends_on, format: '%e %B'))
  end
end
