# frozen_string_literal: true

class ExerciseTechnique < ApplicationRecord
  belongs_to :exercise
  belongs_to :technique
end
