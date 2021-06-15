# frozen_string_literal: true

class CreatePeriodPrinciples < ActiveRecord::Migration[6.1]
  def change
    create_table :period_principles do |t|
      t.belongs_to :period, null: false, foreign_key: true
      t.belongs_to :principle, null: false, foreign_key: true
      t.string :tagline
      t.string :description
      t.string :training_tips
      t.string :match_tips

      t.timestamps
    end
  end
end
