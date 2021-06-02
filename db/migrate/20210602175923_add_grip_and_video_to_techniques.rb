# frozen_string_literal: true

class AddGripAndVideoToTechniques < ActiveRecord::Migration[6.1]
  def change
    change_table :techniques, bulk: true do |t|
      t.integer :grip
      t.string :video
    end
  end
end
