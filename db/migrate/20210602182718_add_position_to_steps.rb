# frozen_string_literal: true

class AddPositionToSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :position, :integer
  end
end
