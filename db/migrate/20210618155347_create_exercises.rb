# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :title
      t.string :objective
      t.references :step, foreign_key: true
      t.string :aasm_state
      t.string :video

      t.timestamps
    end
  end
end
