# frozen_string_literal: true

class RemoveRedundantDescriptionColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :principles, :description, type: :string
    remove_column :skills, :description, type: :string
    remove_column :steps, :description, type: :string
  end
end
