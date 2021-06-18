# frozen_string_literal: true

class CreateExerciseTechniques < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_techniques do |t|
      t.references :exercise, foreign_key: true
      t.references :technique, foreign_key: true

      t.timestamps
    end
  end
end
