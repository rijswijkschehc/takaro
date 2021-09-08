# frozen_string_literal: true

class CreateEquipmentLocks < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_locks do |t|
      t.integer :number
      t.string :code
      t.belongs_to :location

      t.timestamps
    end
  end
end
