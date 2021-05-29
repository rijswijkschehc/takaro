# frozen_string_literal: true

class CreatePrincipleSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :principle_steps do |t|
      t.references :principle
      t.references :step

      t.timestamps
    end
  end
end
