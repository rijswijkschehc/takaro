# frozen_string_literal: true

class CreateTrainingPrinciples < ActiveRecord::Migration[6.1]
  def change
    create_table :training_principles do |t|
      t.references :training
      t.references :principle

      t.timestamps
    end
  end
end
