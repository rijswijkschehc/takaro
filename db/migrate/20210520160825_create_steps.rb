# frozen_string_literal: true

class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :name
      t.string :description
      t.string :icon

      t.timestamps
    end
  end
end
