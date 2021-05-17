# frozen_string_literal: true

class CreateTargetCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :target_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
