# frozen_string_literal: true

class CreateStaticPages < ActiveRecord::Migration[6.1]
  def change
    create_table :static_pages do |t|
      t.string :title
      t.string :path
      t.string :aasm_state

      t.timestamps
    end
  end
end
