# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :screen_name
      t.references :user

      t.timestamps
    end
  end
end
