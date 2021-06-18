# frozen_string_literal: true

class CreateExercisePrinciples < ActiveRecord::Migration[6.1]
  def change
    create_table :exercise_principles do |t|
      t.references :exercise, foreign_key: true
      t.references :principle, foreign_key: true

      t.timestamps
    end
  end
end
