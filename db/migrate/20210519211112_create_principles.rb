# frozen_string_literal: true

class CreatePrinciples < ActiveRecord::Migration[6.1]
  def change
    create_table :principles do |t|
      t.string :name
      t.string :tagline
      t.string :hex_color, limit: 6
      t.string :icon
      t.string :description

      t.timestamps
    end
  end
end
