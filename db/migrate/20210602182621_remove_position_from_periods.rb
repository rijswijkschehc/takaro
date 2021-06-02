# frozen_string_literal: true

class RemovePositionFromPeriods < ActiveRecord::Migration[6.1]
  def change
    remove_column :periods, :position, type: :integer
  end
end
