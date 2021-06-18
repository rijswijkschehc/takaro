# frozen_string_literal: true

class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :title
      t.string :objective
      t.references :step
      t.string :aasm_state

      t.timestamps
    end
  end
end
