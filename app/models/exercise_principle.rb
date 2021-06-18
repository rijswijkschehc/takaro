# frozen_string_literal: true

class ExercisePrinciple < ApplicationRecord
  belongs_to :exercise
  belongs_to :principle
end
