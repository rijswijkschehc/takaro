# frozen_string_literal: true

class AddAncestryToComments < ActiveRecord::Migration[6.1]
  def up
    rename_column :comments, :parent_id, :ancestry
    change_column :comments, :ancestry, :string
  end
end
