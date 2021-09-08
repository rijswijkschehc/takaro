# frozen_string_literal: true

class AddUniquenessIndexToEquipmentLocations < ActiveRecord::Migration[6.1]
  def change
    add_index :equipment_locations, %i[name ancestry], unique: true
  end
end
