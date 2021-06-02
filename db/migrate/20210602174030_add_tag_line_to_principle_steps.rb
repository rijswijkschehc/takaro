# frozen_string_literal: true

class AddTagLineToPrincipleSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :principle_steps, :tag_line, :string
  end
end
