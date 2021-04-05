# frozen_string_literal: true

class RolifyCreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, polymorphic: true
      t.timestamps
    end

    create_table(:user_roles) do |t|
      t.references :user
      t.references :role
      t.timestamps
    end

    add_index(:roles, %i[name resource_type resource_id])
    add_index(:user_roles, %i[user_id role_id])
  end
end
