# frozen_string_literal: true

class CreatePersonUserConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :person_user_connections do |t|
      t.belongs_to :person, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
