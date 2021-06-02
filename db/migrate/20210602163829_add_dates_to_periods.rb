# frozen_string_literal: true

class AddDatesToPeriods < ActiveRecord::Migration[6.1]
  def change
    add_columns :periods, :starts_on, :ends_on, type: :date
  end
end
