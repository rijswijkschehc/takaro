# frozen_string_literal: true

When 'the trainings page is shown' do
  visit trainings_path
end

When 'the training page for {training} is shown' do |training|
  visit training_path(training)
end
