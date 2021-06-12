# frozen_string_literal: true

class RenameTagLineToTagline < ActiveRecord::Migration[6.1]
  def change
    rename_column :principle_steps, :tag_line, :tagline
  end
end
