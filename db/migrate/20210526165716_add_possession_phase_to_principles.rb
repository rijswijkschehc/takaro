# frozen_string_literal: true

class AddPossessionPhaseToPrinciples < ActiveRecord::Migration[6.1]
  def change
    add_reference :principles, :possession_phase
  end
end
