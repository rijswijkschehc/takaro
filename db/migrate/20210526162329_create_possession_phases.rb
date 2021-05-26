# frozen_string_literal: true

class CreatePossessionPhases < ActiveRecord::Migration[6.1]
  def change
    create_table :possession_phases do |t|
      t.string :name

      t.timestamps
    end
  end
end
