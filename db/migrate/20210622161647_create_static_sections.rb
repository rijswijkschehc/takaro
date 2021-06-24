# frozen_string_literal: true

class CreateStaticSections < ActiveRecord::Migration[6.1]
  def change
    create_table :static_sections do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end

    add_index :static_sections, :identifier, unique: true
  end
end
