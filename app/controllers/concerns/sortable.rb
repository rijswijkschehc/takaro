# frozen_string_literal: true

module Sortable
  extend ActiveSupport::Concern

  def reposition
    model.find(params[:id]).set_list_position(params[:position])
  end
end
