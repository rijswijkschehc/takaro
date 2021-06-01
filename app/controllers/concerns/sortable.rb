# frozen_string_literal: true

module Sortable
  extend ActiveSupport::Concern

  def reposition
    record.set_list_position(params[:position])
  end

  private

  def record
    controller_name.classify.constantize.find(params[:id])
  end
end
