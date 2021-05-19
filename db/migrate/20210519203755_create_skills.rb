# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
