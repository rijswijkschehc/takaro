# frozen_string_literal: true

class CreatePeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
