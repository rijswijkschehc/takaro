# frozen_string_literal: true

class AddPositionToEquipmentLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :equipment_locations, :position, :integer
  end
end
