# frozen_string_literal: true

class CreateEquipmentLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_locations do |t|
      t.string :name
      t.string :ancestry
      t.string :owner

      t.timestamps
    end
  end
end
