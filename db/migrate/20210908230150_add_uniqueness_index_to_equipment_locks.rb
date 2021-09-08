# frozen_string_literal: true

class AddUniquenessIndexToEquipmentLocks < ActiveRecord::Migration[6.1]
  def change
    add_index :equipment_locks, %i[number], unique: true
  end
end
