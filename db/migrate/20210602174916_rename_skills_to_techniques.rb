# frozen_string_literal: true

class RenameSkillsToTechniques < ActiveRecord::Migration[6.1]
  def change
    rename_table :skills, :techniques
  end
end
