# frozen_string_literal: true

When 'the exercises page is shown' do
  visit exercises_path
end

When 'the exercise page for {exercise} is shown' do |exercise|
  visit exercise_path(exercise)
end
