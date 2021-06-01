# frozen_string_literal: true

class AddPositionToPrinciples < ActiveRecord::Migration[6.1]
  def change
    add_column :principles, :position, :integer

    Principle.find_each.each_with_index do |principle, index|
      principle.update(position: index + 1)
    end
  end
end
